
unit EditENHook;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENHookController ;

type
  TfrmENHookEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHookTypeName: TLabel;
    edtENHookTypeName: TEdit;
    spbENHookType: TSpeedButton;
    HTTPRIOENHook: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENElementClick(Sender : TObject);
  procedure spbENHookTypeClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENHookEdit: TfrmENHookEdit;
  ENHookObj: ENHook;

implementation

uses ShowENElement, ENElementController, ShowENHookType, ENHookTypeController,
  ShowTKMaterials, TKMaterialsController;

{$R *.dfm}

procedure TfrmENHookEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  DisableControls([edtENHookTypeName, edtMaterialsName]);
  if DialogState = dsView then
    DisableControls([edtENElementName, spbENElement, spbENHookType,
      spbTkMaterials]);
  (*if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName]);*)
  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENHookObj.code);
      if ENHookObj.name = '' then
        edtName.Text := 'Крюк опори'
      else
        edtName.Text := ENHookObj.name;
      //edtENElementName.Text := IntToStr(ENHookObj.element.code);
      edtENHookTypeName.Text := ENHookObj.hookType.name;

      if ENHookObj.materialRef <> nil then
        if ENHookObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENHookObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
  end;
end;

procedure TfrmENHookEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHook: ENHookControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([{edtName, }edtENHookTypeName, edtMaterialsName]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы!'),
          PChar('Внимание!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
        ENHookObj.name := edtName.Text;
        if DialogState = dsInsert then
          begin
            ENHookObj.code := low(Integer);
            TempENHook.add(ENHookObj);
          end
        else if DialogState = dsEdit then
          TempENHook.save(ENHookObj);
      end;
end;


procedure TfrmENHookEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
          try
             if ENHookObj.element = nil then ENHookObj.element := ENElement.Create();
             ENHookObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
             edtENElementName.Text:=GetReturnValue(sgENElement,1);
          except
             on EConvertError do Exit;
          end;
      end;
  finally
    frmENElementShow.Free;
  end;*)
end;

procedure TfrmENHookEdit.spbENHookTypeClick(Sender : TObject);
var frmENHookTypeShow: TfrmENHookTypeShow;
begin
  frmENHookTypeShow := TfrmENHookTypeShow.Create(Application, fmNormal);
  try
    with frmENHookTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENHookObj.hookType = nil then
             ENHookObj.hookType := ENHookType.Create();
            ENHookObj.hookType.code :=
             StrToInt(GetReturnValue(sgENHookType, 0));
            edtENHookTypeName.Text := GetReturnValue(sgENHookType, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENHookTypeShow.Free;
  end;
end;



procedure TfrmENHookEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        DenyGroupSelection := true;
        if ShowModal = mrOk then
        begin
          try
            if ENHookObj.materialRef = nil then
              ENHookObj.materialRef := TKMaterialsRef.Create;
            ENHookObj.materialRef.code :=
              TKMaterialsShort(tvDep.Selected.Data).code;
            edtMaterialsName.Text :=
              TKMaterialsShort(tvDep.Selected.Data).name;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
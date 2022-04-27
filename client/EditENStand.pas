unit EditENStand;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
    Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio,
    SOAPHTTPClient, ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList,
    BaseGrid,  XSBuiltIns, GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENStandController ;

type
  TfrmENStandEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENStandTypeMaterialName: TLabel;
    edtENStandTypeMaterialName: TEdit;
    spbENStandTypeMaterial: TSpeedButton;
  

  HTTPRIOENStand: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementClick(Sender : TObject);
  procedure spbENStandTypeMaterialClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENStandEdit: TfrmENStandEdit;
  ENStandObj: ENStand;

implementation

uses ShowENElement, ENElementController, ShowENStandType, ENStandTypeController,
  ShowTKMaterials, TKMaterialsController;

{$R *.dfm}

procedure TfrmENStandEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin

  DisableControls([edtENStandTypeMaterialName, edtMaterialsName]);

  if DialogState = dsView then
    DisableControls([edtENElementName, spbENElement, spbENStandTypeMaterial,
      spbTkMaterials]);

  (*if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName]);*)

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENStandObj.code);
      if ENStandObj.name = '' then
        edtName.Text := 'Стойка опори'
      else
        edtName.Text := ENStandObj.name;
      //edtENElementName.Text := ENStandObj.element.name;
      edtENStandTypeMaterialName.Text := ENStandObj.materialType.name;

      if ENStandObj.materialRef <> nil then
        if ENStandObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENStandObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

    end;
end;

procedure TfrmENStandEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStand: ENStandControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([{edtName,}
      edtENStandTypeMaterialName, edtMaterialsName])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENStand := HTTPRIOENStand as ENStandControllerSoapPort;
        ENStandObj.name := edtName.Text;
        if DialogState = dsInsert then
          begin
            ENStandObj.code := low(Integer);
            TempENStand.add(ENStandObj);
          end
        else if DialogState = dsEdit then
          TempENStand.save(ENStandObj);
      end;
end;


procedure TfrmENStandEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow := TfrmENElementShow.Create(Application,fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
           if ENStandObj.element = nil then ENStandObj.element := ENElement.Create();
           ENStandObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
           edtENElementName.Text:=GetReturnValue(sgENElement,1);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;*)
end;

procedure TfrmENStandEdit.spbENStandTypeMaterialClick(Sender : TObject);
var frmENStandTypeShow: TfrmENStandTypeShow;
begin
  frmENStandTypeShow := TfrmENStandTypeShow.Create(Application,fmNormal);
  try
    with frmENStandTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENStandObj.materialType = nil then
              ENStandObj.materialType := ENStandType.Create();
            ENStandObj.materialType.code :=
              StrToInt(GetReturnValue(sgENStandType, 0));
            edtENStandTypeMaterialName.Text :=
              GetReturnValue(sgENStandType, 1);
          except
            on EConvertError do Exit;
          end;
      end;
  finally
    frmENStandTypeShow.Free;
  end;
end;

procedure TfrmENStandEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //Исключено объявление не используемых переменных
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
            if ENStandObj.materialRef = nil then
              ENStandObj.materialRef := TKMaterialsRef.Create;
            ENStandObj.materialRef.code :=
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
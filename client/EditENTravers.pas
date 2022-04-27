unit EditENTravers;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTraversController ;

type
  TfrmENTraversEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENTraversTypeName: TLabel;
    edtENTraversTypeName: TEdit;
    spbENTraversType: TSpeedButton;
    HTTPRIOENTravers: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENElementClick(Sender : TObject);
  procedure spbENTraversTypeClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTraversEdit: TfrmENTraversEdit;
  ENTraversObj: ENTravers;

implementation

uses ShowENElement, ENElementController, ShowENTraversType,
  ENTraversTypeController, ShowTKMaterials, TKMaterialsController;

{$R *.dfm}

procedure TfrmENTraversEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  DisableControls([edtENTraversTypeName, edtMaterialsName]);
  if DialogState = dsView then
    DisableControls([edtENElementName, spbENElement, spbENTraversType,
      spbTkMaterials]);
  (*if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName]);*)

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENTraversObj.code);
      if ENTraversObj.name = '' then
        edtName.Text := '“раверса опори'
      else
        edtName.Text := ENTraversObj.name;
      //edtENElementName.Text := ENTraversObj.element.name;
      edtENTraversTypeName.Text := ENTraversObj.traversType.name;
      if ENTraversObj.materialRef <> nil then
        if ENTraversObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENTraversObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
    end;
end;



procedure TfrmENTraversEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravers: ENTraversControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([{edtName, }edtENTraversTypeName, edtMaterialsName])
    then
      begin
        Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),
          PChar('¬нимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENTravers := HTTPRIOENTravers as ENTraversControllerSoapPort;
        ENTraversObj.name := edtName.Text;
        if DialogState = dsInsert then
          begin
            ENTraversObj.code := low(Integer);
            TempENTravers.add(ENTraversObj);
          end
        else if DialogState = dsEdit then
          TempENTravers.save(ENTraversObj);
      end;
end;


procedure TfrmENTraversEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
          try
             if ENTraversObj.element = nil then ENTraversObj.element := ENElement.Create();
             ENTraversObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
             edtENElementName.Text:=GetReturnValue(sgENElement,1);
          except
             on EConvertError do Exit;
          end;
      end;
  finally
    frmENElementShow.Free;
  end;*)
end;

procedure TfrmENTraversEdit.spbENTraversTypeClick(Sender : TObject);
var frmENTraversTypeShow: TfrmENTraversTypeShow;
begin
  frmENTraversTypeShow := TfrmENTraversTypeShow.Create(Application, fmNormal);
  try
    with frmENTraversTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENTraversObj.traversType = nil then
              ENTraversObj.traversType := ENTraversType.Create();
            ENTraversObj.traversType.code :=
              StrToInt(GetReturnValue(sgENTraversType, 0));
            edtENTraversTypeName.Text := GetReturnValue(sgENTraversType, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENTraversTypeShow.Free;
  end;
end;



procedure TfrmENTraversEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //»сключено объ€вление не используемых переменных
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
            if ENTraversObj.materialRef = nil then
              ENTraversObj.materialRef := TKMaterialsRef.Create;
            ENTraversObj.materialRef.code :=
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
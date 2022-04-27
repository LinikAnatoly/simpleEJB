
unit EditENFamilySize2ServicesObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENFamilySize2ServicesObjectController;

type
    TfrmENFamilySize2ServicesObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblFIO : TLabel;
    edtFIO: TEdit;

    HTTPRIOENFamilySize2ServicesObject: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblRelation: TLabel;
    edtRelation: TEdit;
    spbRelation: TSpeedButton;
    HTTPRIOENFamilyRelation: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRelationClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFamilySize2ServicesObjectEdit: TfrmENFamilySize2ServicesObjectEdit;
  ENFamilySize2ServicesObjectObj: ENFamilySize2ServicesObject;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFamilySize2ServicesObjectController  ;
}
{$R *.dfm}

uses
  ShowENFamilyRelation, ENFamilyRelationController;


procedure TfrmENFamilySize2ServicesObjectEdit.FormShow(Sender: TObject);
var
  TempENFamilyRelation : ENFamilyRelationControllerSoapPort;
begin
  DisableControls([edtCode]);
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);

  DisableControls([edtRelation]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtFIO, edtRelation]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;

    edtCode.Text := IntToStr(ENFamilySize2ServicesObjectObj.code);
    edtFIO.Text := ENFamilySize2ServicesObjectObj.FIO;
    edtRelation.Text := TempENFamilyRelation.getObject(ENFamilySize2ServicesObjectObj.relationRef.code).relation;
  end;
end;


procedure TfrmENFamilySize2ServicesObjectEdit.spbRelationClick(Sender: TObject);
var
  frmENFamilyRelationShow : TfrmENFamilyRelationShow;
  familyRelationFilter : ENFamilyRelationFilter;
begin
  inherited;
  familyRelationFilter := ENFamilyRelationFilter.Create();
  SetNullXSProps(familyRelationFilter);
  SetNullIntProps(familyRelationFilter);

  frmENFamilyRelationShow := TfrmENFamilyRelationShow.Create(Application, fmNormal, familyRelationFilter);
  DisableActions([frmENFamilyRelationShow.actInsert, frmENFamilyRelationShow.actDelete, frmENFamilyRelationShow.actEdit]);

  try
    with frmENFamilyRelationShow do
    if ShowModal = mrOk then
    begin
      try
         ENFamilySize2ServicesObjectObj.relationRef := ENFamilyRelationRef.Create;
         ENFamilySize2ServicesObjectObj.relationRef.code := StrToInt(GetReturnValue(sgENFamilyRelation,0));
         edtRelation.Text := GetReturnValue(sgENFamilyRelation,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENFamilyRelationShow.Free;
  end;
end;


procedure TfrmENFamilySize2ServicesObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENFamilySize2ServicesObject: ENFamilySize2ServicesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtFIO, edtRelation])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENFamilySize2ServicesObject := HTTPRIOENFamilySize2ServicesObject as ENFamilySize2ServicesObjectControllerSoapPort;

    ENFamilySize2ServicesObjectObj.FIO := edtFIO.Text;

    if DialogState = dsInsert then
    begin
      ENFamilySize2ServicesObjectObj.code:=low(Integer);
      TempENFamilySize2ServicesObject.add(ENFamilySize2ServicesObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFamilySize2ServicesObject.save(ENFamilySize2ServicesObjectObj);
    end;
  end;
end;


end.
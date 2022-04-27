
unit EditENFamilyRelation;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENFamilyRelationController ;

type
    TfrmENFamilyRelationEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;
    lblRelation : TLabel;
    edtRelation: TEdit;

    HTTPRIOENFamilyRelation: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFamilyRelationEdit: TfrmENFamilyRelationEdit;
  ENFamilyRelationObj: ENFamilyRelation;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFamilyRelationController  ;
}
{$R *.dfm}



procedure TfrmENFamilyRelationEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtRelation
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFamilyRelationObj.code);
    edtRelation.Text := ENFamilyRelationObj.relation;


  end;
end;



procedure TfrmENFamilyRelationEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtRelation
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;

     ENFamilyRelationObj.relation := edtRelation.Text;

    if DialogState = dsInsert then
    begin
      ENFamilyRelationObj.code:=low(Integer);
      TempENFamilyRelation.add(ENFamilyRelationObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFamilyRelation.save(ENFamilyRelationObj);
    end;
  end;
end;


end.
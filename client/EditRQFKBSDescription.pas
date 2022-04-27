
unit EditRQFKBSDescription;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKBSDescriptionController ;

type
  TfrmRQFKBSDescriptionEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQFKBSDescription: THTTPRIO;

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
  frmRQFKBSDescriptionEdit: TfrmRQFKBSDescriptionEdit;
  RQFKBSDescriptionObj: RQFKBSDescription;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKBSDescriptionController  ;
}
{$R *.dfm}



procedure TfrmRQFKBSDescriptionEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQFKBSDescriptionObj.code);
    edtName.Text := RQFKBSDescriptionObj.name; 


  end;
end;



procedure TfrmRQFKBSDescriptionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;


     RQFKBSDescriptionObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQFKBSDescriptionObj.code:=low(Integer);
      TempRQFKBSDescription.add(RQFKBSDescriptionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKBSDescription.save(RQFKBSDescriptionObj);
    end;
  end;
end;


end.
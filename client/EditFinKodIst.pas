
unit EditFinKodIst;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FinKodIstController ;

type
  TfrmFinKodIstEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFinKodIst: THTTPRIO;

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
  frmFinKodIstEdit: TfrmFinKodIstEdit;
  FinKodIstObj: FinKodIst;

implementation


{uses  
    EnergyproController, EnergyproController2, FinKodIstController  ;
}
{$R *.dfm}



procedure TfrmFinKodIstEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FinKodIstObj.code);
    edtName.Text := FinKodIstObj.name; 


  end;
end;



procedure TfrmFinKodIstEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFinKodIst: FinKodIstControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFinKodIst := HTTPRIOFinKodIst as FinKodIstControllerSoapPort;


     FinKodIstObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FinKodIstObj.code:=low(Integer);
      TempFinKodIst.add(FinKodIstObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFinKodIst.save(FinKodIstObj);
    end;
  end;
end;


end.
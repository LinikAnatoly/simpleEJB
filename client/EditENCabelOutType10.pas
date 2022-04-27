
unit EditENCabelOutType10;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelOutType10Controller ;

type
  TfrmENCabelOutType10Edit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENCabelOutType10: THTTPRIO;

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
  frmENCabelOutType10Edit: TfrmENCabelOutType10Edit;
  ENCabelOutType10Obj: ENCabelOutType10;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCabelOutType10Controller  ;
}
{$R *.dfm}



procedure TfrmENCabelOutType10Edit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENCabelOutType10Obj.code);
    edtName.Text := ENCabelOutType10Obj.name; 


  end;
end;



procedure TfrmENCabelOutType10Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCabelOutType10: ENCabelOutType10ControllerSoapPort;
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
    TempENCabelOutType10 := HTTPRIOENCabelOutType10 as ENCabelOutType10ControllerSoapPort;


     ENCabelOutType10Obj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENCabelOutType10Obj.code:=low(Integer);
      TempENCabelOutType10.add(ENCabelOutType10Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCabelOutType10.save(ENCabelOutType10Obj);
    end;
  end;
end;


end.

unit EditRQSpravDKPP;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQSpravDKPPController ;

type
  TfrmRQSpravDKPPEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;


  HTTPRIORQSpravDKPP: THTTPRIO;

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
  frmRQSpravDKPPEdit: TfrmRQSpravDKPPEdit;
  RQSpravDKPPObj: RQSpravDKPP;

implementation


{uses  
    EnergyproController, EnergyproController2, RQSpravDKPPController  ;
}
{$R *.dfm}



procedure TfrmRQSpravDKPPEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQSpravDKPPObj.code);
    MakeMultiline(edtName.Lines, RQSpravDKPPObj.name);


  end;
end;



procedure TfrmRQSpravDKPPEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
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
    TempRQSpravDKPP := HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;


     RQSpravDKPPObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQSpravDKPPObj.code:=low(Integer);
      TempRQSpravDKPP.add(RQSpravDKPPObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQSpravDKPP.save(RQSpravDKPPObj);
    end;
  end;
end;


end.

unit EditKarta_dolz;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, Karta_dolzController ;

type
  TfrmKarta_dolzEdit = class(TDialogForm)

    lblName_dolz : TLabel;
    edtName_dolz: TEdit;
    lblRazryad : TLabel;
    edtRazryad: TEdit;


  HTTPRIOKarta_dolz: THTTPRIO;

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
  frmKarta_dolzEdit: TfrmKarta_dolzEdit;
  Karta_dolzObj: Karta_dolz;

implementation


{uses  
    EnergyproController, EnergyproController2, Karta_dolzController  ;
}
{$R *.dfm}



procedure TfrmKarta_dolzEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName_dolz
      ,edtRazryad
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName_dolz.Text := Karta_dolzObj.name_dolz; 
    edtRazryad.Text := Karta_dolzObj.razryad; 


  end;
end;



procedure TfrmKarta_dolzEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempKarta_dolz: Karta_dolzControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName_dolz
      ,edtRazryad
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempKarta_dolz := HTTPRIOKarta_dolz as Karta_dolzControllerSoapPort;


     Karta_dolzObj.name_dolz := edtName_dolz.Text; 

     Karta_dolzObj.razryad := edtRazryad.Text; 

    if DialogState = dsInsert then
    begin
      Karta_dolzObj.id:=low(Integer);
      TempKarta_dolz.add(Karta_dolzObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempKarta_dolz.save(Karta_dolzObj);
    end;
  end;
end;


end.
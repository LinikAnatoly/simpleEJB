
unit EditKarti;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2 ;

type
  TfrmKartiEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblNumGen : TLabel;
    edtNumGen: TEdit;


  HTTPRIOKarti: THTTPRIO;

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
  frmKartiEdit: TfrmKartiEdit;
  KartiObj: Karti;

implementation


{$R *.dfm}



procedure TfrmKartiEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := KartiObj.name; 
    edtNumGen.Text := KartiObj.numGen; 


  end;
end;



procedure TfrmKartiEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempKarti: TKTechCardControllerSoapPort;
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
    TempKarti := HTTPRIOKarti as TKTechCardControllerSoapPort;


     KartiObj.name := edtName.Text; 

     KartiObj.numGen := edtNumGen.Text; 

    if DialogState = dsInsert then
    begin
      KartiObj.code:=low(Integer);
      TempKarti.add(KartiObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempKarti.save(KartiObj);
    end;
  end;
end;


end.
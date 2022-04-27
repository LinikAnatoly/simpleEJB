
unit EditRQOrgBank;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgBankController ;

type
  TfrmRQOrgBankEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblId : TLabel;
    edtId: TEdit;
    lblMfo : TLabel;
    edtMfo: TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrgBank: THTTPRIO;

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
  frmRQOrgBankEdit: TfrmRQOrgBankEdit;
  RQOrgBankObj: RQOrgBank;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrgBankController  ;
}
{$R *.dfm}



procedure TfrmRQOrgBankEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtId
      ,edtMfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQOrgBankObj.code);
    if ( RQOrgBankObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrgBankObj.id)
    else
       edtId.Text := '';
    edtMfo.Text := RQOrgBankObj.mfo; 
    edtName.Text := RQOrgBankObj.name; 


  end;
end;



procedure TfrmRQOrgBankEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrgBank: RQOrgBankControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtId
      ,edtMfo
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;


     if ( edtId.Text <> '' ) then
       RQOrgBankObj.id := StrToInt(edtId.Text)
     else
       RQOrgBankObj.id := Low(Integer) ;

     RQOrgBankObj.mfo := edtMfo.Text; 

     RQOrgBankObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrgBankObj.code:=low(Integer);
      TempRQOrgBank.add(RQOrgBankObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrgBank.save(RQOrgBankObj);
    end;
  end;
end;


end.
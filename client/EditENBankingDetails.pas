
unit EditENBankingDetails;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBankingDetailsController ;

type
  TfrmENBankingDetailsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblBankname : TLabel;
    edtBankname: TEdit;
    lblBankokpo : TLabel;
    edtBankokpo: TEdit;
    lblBankmfo : TLabel;
    edtBankmfo: TEdit;
    lblBankaccount : TLabel;
    edtBankaccount: TEdit;
    lblPartnercode : TLabel;
    edtPartnercode: TEdit;
    lblContract : TLabel;
    edtContract: TEdit;
    lblUseDefault : TLabel;
    edtUseDefault: TEdit;


  HTTPRIOENBankingDetails: THTTPRIO;

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
  frmENBankingDetailsEdit: TfrmENBankingDetailsEdit;
  ENBankingDetailsObj: ENBankingDetails;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBankingDetailsController  ;
}
{$R *.dfm}



procedure TfrmENBankingDetailsEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtBankname
      ,edtBankokpo
      ,edtBankmfo
      ,edtBankaccount
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBankingDetailsObj.code);
    edtBankname.Text := ENBankingDetailsObj.bankname; 
    edtBankokpo.Text := ENBankingDetailsObj.bankokpo; 
    if ( ENBankingDetailsObj.bankmfo <> Low(Integer) ) then
       edtBankmfo.Text := IntToStr(ENBankingDetailsObj.bankmfo)
    else
       edtBankmfo.Text := '';
    edtBankaccount.Text := ENBankingDetailsObj.bankaccount;
    edtPartnercode.Text := ENBankingDetailsObj.partnercode; 
    edtContract.Text := ENBankingDetailsObj.contract; 
    if ( ENBankingDetailsObj.useDefault <> Low(Integer) ) then
       edtUseDefault.Text := IntToStr(ENBankingDetailsObj.useDefault)
    else
       edtUseDefault.Text := '';


  end;
end;



procedure TfrmENBankingDetailsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBankingDetails: ENBankingDetailsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtBankname
      ,edtBankokpo
      ,edtBankmfo
      ,edtBankaccount
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBankingDetails := HTTPRIOENBankingDetails as ENBankingDetailsControllerSoapPort;


     ENBankingDetailsObj.bankname := edtBankname.Text; 

     ENBankingDetailsObj.bankokpo := edtBankokpo.Text; 

     if ( edtBankmfo.Text <> '' ) then
       ENBankingDetailsObj.bankmfo := StrToInt(edtBankmfo.Text)
     else
       ENBankingDetailsObj.bankmfo := Low(Integer) ;

     ENBankingDetailsObj.bankaccount := edtBankaccount.Text;

     ENBankingDetailsObj.partnercode := edtPartnercode.Text; 

     ENBankingDetailsObj.contract := edtContract.Text; 

     if ( edtUseDefault.Text <> '' ) then
       ENBankingDetailsObj.useDefault := StrToInt(edtUseDefault.Text)
     else
       ENBankingDetailsObj.useDefault := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENBankingDetailsObj.code:=low(Integer);
      TempENBankingDetails.add(ENBankingDetailsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBankingDetails.save(ENBankingDetailsObj);
    end;
  end;
end;


end.
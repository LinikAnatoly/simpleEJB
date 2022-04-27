
unit EditENBankingDetailsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBankingDetailsController ;

type
  TfrmENBankingDetailsFilterEdit = class(TDialogForm)

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
  frmENBankingDetailsFilterEdit: TfrmENBankingDetailsFilterEdit;
  ENBankingDetailsFilterObj: ENBankingDetailsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBankingDetailsController  ;
}
{$R *.dfm}



procedure TfrmENBankingDetailsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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

    edtBankname.Text := ENBankingDetailsObj.bankname; 



    edtBankokpo.Text := ENBankingDetailsObj.bankokpo; 



    if ( ENBankingDetailsObj.bankmfo <> Low(Integer) ) then
       edtBankmfo.Text := IntToStr(ENBankingDetailsObj.bankmfo)
    else
       edtBankmfo.Text := '';



    if ( ENBankingDetailsObj.bankaccount <> Low(Int64) ) then
       edtBankaccount.Text := IntToStr(ENBankingDetailsObj.bankaccount)
    else
       edtBankaccount.Text := '';



    edtPartnercode.Text := ENBankingDetailsObj.partnercode; 



    edtContract.Text := ENBankingDetailsObj.contract; 



    if ( ENBankingDetailsObj.useDefault <> Low(Integer) ) then
       edtUseDefault.Text := IntToStr(ENBankingDetailsObj.useDefault)
    else
       edtUseDefault.Text := '';


  end;

}

end;



procedure TfrmENBankingDetailsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBankingDetails: ENBankingDetailsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBankingDetailsFilterObj.bankname := edtBankname.Text; 



     ENBankingDetailsFilterObj.bankokpo := edtBankokpo.Text; 



     if ( edtBankmfo.Text <> '' ) then
       ENBankingDetailsFilterObj.bankmfo := StrToInt(edtBankmfo.Text)
     else
       ENBankingDetailsFilterObj.bankmfo := Low(Integer) ;
	   



     if ( edtBankaccount.Text <> '' ) then
       ENBankingDetailsFilterObj.bankaccount := edtBankaccount.Text;



     ENBankingDetailsFilterObj.partnercode := edtPartnercode.Text; 



     ENBankingDetailsFilterObj.contract := edtContract.Text; 



     if ( edtUseDefault.Text <> '' ) then
       ENBankingDetailsFilterObj.useDefault := StrToInt(edtUseDefault.Text)
     else
       ENBankingDetailsFilterObj.useDefault := Low(Integer) ;
	   




  end;
end;




end.
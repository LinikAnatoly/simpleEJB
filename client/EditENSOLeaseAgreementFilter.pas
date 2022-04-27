
unit EditENSOLeaseAgreementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOLeaseAgreementController ;

type
  TfrmENSOLeaseAgreementFilterEdit = class(TDialogForm)

    lblNumContract : TLabel;
    edtNumContract: TEdit;

    lblDateContract : TLabel;
    edtDateContract: TDateTimePicker;
    lblNamePartner : TLabel;
    edtNamePartner: TMemo;

    lblFinDocID : TLabel;
    edtFinDocID: TEdit;



  HTTPRIOENSOLeaseAgreement: THTTPRIO;

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
  frmENSOLeaseAgreementFilterEdit: TfrmENSOLeaseAgreementFilterEdit;
  ENSOLeaseAgreementFilterObj: ENSOLeaseAgreementFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOLeaseAgreementController  ;
}
{$R *.dfm}



procedure TfrmENSOLeaseAgreementFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumContract
      ,edtDateContract
      ,edtNamePartner
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumContract.Text := ENSOLeaseAgreementObj.numContract; 



      if ENSOLeaseAgreementObj.dateContract <> nil then
      begin
        edtDateContract.DateTime:=EncodeDate(ENSOLeaseAgreementObj.dateContract.Year,ENSOLeaseAgreementObj.dateContract.Month,ENSOLeaseAgreementObj.dateContract.Day);
        edtDateContract.checked := true;
      end
      else
      begin
        edtDateContract.DateTime:=SysUtils.Date;
        edtDateContract.checked := false;
      end;



    MakeMultiline(edtNamePartner.Lines, ENSOLeaseAgreementObj.namePartner);



    if ( ENSOLeaseAgreementObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENSOLeaseAgreementObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;

}

end;



procedure TfrmENSOLeaseAgreementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSOLeaseAgreementFilterObj.numContract := edtNumContract.Text; 



     if edtdateContract.checked then
     begin 
       if ENSOLeaseAgreementFilterObj.dateContract = nil then
          ENSOLeaseAgreementFilterObj.dateContract := TXSDate.Create;
       ENSOLeaseAgreementFilterObj.dateContract.XSToNative(GetXSDate(edtdateContract.DateTime));
     end
     else
       ENSOLeaseAgreementFilterObj.dateContract := nil;



     ENSOLeaseAgreementFilterObj.namePartner := edtNamePartner.Text; 



     if ( edtFinDocID.Text <> '' ) then
       ENSOLeaseAgreementFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENSOLeaseAgreementFilterObj.finDocID := Low(Integer) ;
	   




  end;
end;




end.
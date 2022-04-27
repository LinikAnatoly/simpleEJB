
unit EditENActIncomeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActIncomeController ;

type
  TfrmENActIncomeFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TEdit;

    lblDategen : TLabel;
    edtDategenStart: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDateStart: TDateTimePicker;
    lblPartnername : TLabel;
    edtPartnername: TEdit;

    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;



  HTTPRIOENActIncome: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblDategenFinal: TLabel;
    edtDategenFinal: TDateTimePicker;
    edtContractDateFinal: TDateTimePicker;
    lblContractDateFinal: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENActIncomeFilterEdit: TfrmENActIncomeFilterEdit;
  ENActIncomeFilterObj: ENActIncomeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActIncomeController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
      ,edtContractNumber
      ,edtContractDate
      ,edtPartnername
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumbergen.Text := ENActIncomeObj.numbergen; 



      if ENActIncomeObj.dategen <> nil then
      begin
        edtDategen.DateTime:=EncodeDate(ENActIncomeObj.dategen.Year,ENActIncomeObj.dategen.Month,ENActIncomeObj.dategen.Day);
        edtDategen.checked := true;
      end
      else
      begin
        edtDategen.DateTime:=SysUtils.Date;
        edtDategen.checked := false;
      end;



    edtCommentGen.Text := ENActIncomeObj.commentGen; 



    edtContractNumber.Text := ENActIncomeObj.contractNumber; 



      if ENActIncomeObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENActIncomeObj.contractDate.Year,ENActIncomeObj.contractDate.Month,ENActIncomeObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtPartnername.Text := ENActIncomeObj.partnername; 



    edtPartnerCode.Text := ENActIncomeObj.partnerCode; 



    edtFinDocCode.Text := ENActIncomeObj.finDocCode; 



    if ( ENActIncomeObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENActIncomeObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;

}

end;



procedure TfrmENActIncomeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActIncome: ENActIncomeControllerSoapPort;
condition : String;
  procedure setDateToCondition(edtDtpToCheck : TDateTimePicker
    ; strFrmtToAdd : String);
    begin
      if edtDtpToCheck.Checked then begin
         AddCondition(condition
           , Format(strFrmtToAdd, [DateToStr(edtDtpToCheck.Date)]));
       end;
    end;
begin
  if (ModalResult = mrOk)  then
  begin

     condition := '';

     ENActIncomeFilterObj.numbergen := edtNumbergen.Text; 

     setDateToCondition(edtDategenStart
       , ' ENACTINCOME.DATEGEN >= to_date(''%s'', ''dd.MM.yyyy'')');

     setDateToCondition(edtDategenFinal
       , ' ENACTINCOME.DATEGEN <= to_date(''%s'', ''dd.MM.yyyy'')');

     ENActIncomeFilterObj.commentGen := edtCommentGen.Text; 



     ENActIncomeFilterObj.contractNumber := edtContractNumber.Text; 



     setDateToCondition(edtContractDateStart
       , ' ENACTINCOME.CONTRACTDATE >= to_date(''%s'', ''dd.MM.yyyy'')');

     setDateToCondition(edtContractDateFinal
       , ' ENACTINCOME.CONTRACTDATE <= to_date(''%s'', ''dd.MM.yyyy'')');



     ENActIncomeFilterObj.partnername := edtPartnername.Text; 



     ENActIncomeFilterObj.partnerCode := edtPartnerCode.Text; 



     ENActIncomeFilterObj.finDocCode := edtFinDocCode.Text;

     ENActIncomeFilterObj.conditionSQL := condition;

  end;
end;




end.
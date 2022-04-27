
unit EditENFuelDistributionSheetFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelDistributionSheetController ;

type
  TfrmENFuelDistributionSheetFilterEdit = class(TDialogForm)

    lblMonthGen : TLabel;
    edtMonthGen: TEdit;

    lblYearGen : TLabel;
    edtYearGen: TEdit;

    lblTotalSum : TLabel;
    edtTotalSum: TEdit;

    lblSum1 : TLabel;
    edtSum1: TEdit;

    lblSum2 : TLabel;
    edtSum2: TEdit;

    lblSum3 : TLabel;
    edtSum3: TEdit;

    lblSum4 : TLabel;
    edtSum4: TEdit;

    lblSum5 : TLabel;
    edtSum5: TEdit;

    lblSum1dec1 : TLabel;
    edtSum1dec1: TEdit;

    lblSum2dec1 : TLabel;
    edtSum2dec1: TEdit;

    lblSum3dec1 : TLabel;
    edtSum3dec1: TEdit;

    lblSum4dec1 : TLabel;
    edtSum4dec1: TEdit;

    lblSum5dec1 : TLabel;
    edtSum5dec1: TEdit;

    lblSum1dec2 : TLabel;
    edtSum1dec2: TEdit;

    lblSum2dec2 : TLabel;
    edtSum2dec2: TEdit;

    lblSum3dec2 : TLabel;
    edtSum3dec2: TEdit;

    lblSum4dec2 : TLabel;
    edtSum4dec2: TEdit;

    lblSum5dec2 : TLabel;
    edtSum5dec2: TEdit;

    lblSum1dec3 : TLabel;
    edtSum1dec3: TEdit;

    lblSum2dec3 : TLabel;
    edtSum2dec3: TEdit;

    lblSum3dec3 : TLabel;
    edtSum3dec3: TEdit;

    lblSum4dec3 : TLabel;
    edtSum4dec3: TEdit;

    lblSum5dec3 : TLabel;
    edtSum5dec3: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelDistributionSheet: THTTPRIO;

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
  frmENFuelDistributionSheetFilterEdit: TfrmENFuelDistributionSheetFilterEdit;
  ENFuelDistributionSheetFilterObj: ENFuelDistributionSheetFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelDistributionSheetController  ;
}
{$R *.dfm}



procedure TfrmENFuelDistributionSheetFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
      ,edtTotalSum
      ,edtSum1
      ,edtSum2
      ,edtSum3
      ,edtSum4
      ,edtSum5
      ,edtSum1dec1
      ,edtSum2dec1
      ,edtSum3dec1
      ,edtSum4dec1
      ,edtSum5dec1
      ,edtSum1dec2
      ,edtSum2dec2
      ,edtSum3dec2
      ,edtSum4dec2
      ,edtSum5dec2
      ,edtSum1dec3
      ,edtSum2dec3
      ,edtSum3dec3
      ,edtSum4dec3
      ,edtSum5dec3
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENFuelDistributionSheetObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENFuelDistributionSheetObj.monthGen)
    else
       edtMonthGen.Text := '';



    if ( ENFuelDistributionSheetObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENFuelDistributionSheetObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( ENFuelDistributionSheetObj.totalSum <> nil ) then
       edtTotalSum.Text := ENFuelDistributionSheetObj.totalSum.decimalString
    else
       edtTotalSum.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum1 <> nil ) then
       edtSum1.Text := ENFuelDistributionSheetObj.sum1.decimalString
    else
       edtSum1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum2 <> nil ) then
       edtSum2.Text := ENFuelDistributionSheetObj.sum2.decimalString
    else
       edtSum2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum3 <> nil ) then
       edtSum3.Text := ENFuelDistributionSheetObj.sum3.decimalString
    else
       edtSum3.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum4 <> nil ) then
       edtSum4.Text := ENFuelDistributionSheetObj.sum4.decimalString
    else
       edtSum4.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum5 <> nil ) then
       edtSum5.Text := ENFuelDistributionSheetObj.sum5.decimalString
    else
       edtSum5.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum1dec1 <> nil ) then
       edtSum1dec1.Text := ENFuelDistributionSheetObj.sum1dec1.decimalString
    else
       edtSum1dec1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum2dec1 <> nil ) then
       edtSum2dec1.Text := ENFuelDistributionSheetObj.sum2dec1.decimalString
    else
       edtSum2dec1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum3dec1 <> nil ) then
       edtSum3dec1.Text := ENFuelDistributionSheetObj.sum3dec1.decimalString
    else
       edtSum3dec1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum4dec1 <> nil ) then
       edtSum4dec1.Text := ENFuelDistributionSheetObj.sum4dec1.decimalString
    else
       edtSum4dec1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum5dec1 <> nil ) then
       edtSum5dec1.Text := ENFuelDistributionSheetObj.sum5dec1.decimalString
    else
       edtSum5dec1.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum1dec2 <> nil ) then
       edtSum1dec2.Text := ENFuelDistributionSheetObj.sum1dec2.decimalString
    else
       edtSum1dec2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum2dec2 <> nil ) then
       edtSum2dec2.Text := ENFuelDistributionSheetObj.sum2dec2.decimalString
    else
       edtSum2dec2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum3dec2 <> nil ) then
       edtSum3dec2.Text := ENFuelDistributionSheetObj.sum3dec2.decimalString
    else
       edtSum3dec2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum4dec2 <> nil ) then
       edtSum4dec2.Text := ENFuelDistributionSheetObj.sum4dec2.decimalString
    else
       edtSum4dec2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum5dec2 <> nil ) then
       edtSum5dec2.Text := ENFuelDistributionSheetObj.sum5dec2.decimalString
    else
       edtSum5dec2.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum1dec3 <> nil ) then
       edtSum1dec3.Text := ENFuelDistributionSheetObj.sum1dec3.decimalString
    else
       edtSum1dec3.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum2dec3 <> nil ) then
       edtSum2dec3.Text := ENFuelDistributionSheetObj.sum2dec3.decimalString
    else
       edtSum2dec3.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum3dec3 <> nil ) then
       edtSum3dec3.Text := ENFuelDistributionSheetObj.sum3dec3.decimalString
    else
       edtSum3dec3.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum4dec3 <> nil ) then
       edtSum4dec3.Text := ENFuelDistributionSheetObj.sum4dec3.decimalString
    else
       edtSum4dec3.Text := ''; 



    if ( ENFuelDistributionSheetObj.sum5dec3 <> nil ) then
       edtSum5dec3.Text := ENFuelDistributionSheetObj.sum5dec3.decimalString
    else
       edtSum5dec3.Text := ''; 



    edtUserGen.Text := ENFuelDistributionSheetObj.userGen; 



      if ENFuelDistributionSheetObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelDistributionSheetObj.dateEdit.Year,ENFuelDistributionSheetObj.dateEdit.Month,ENFuelDistributionSheetObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENFuelDistributionSheetFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtMonthGen.Text <> '' ) then
       ENFuelDistributionSheetFilterObj.monthGen := StrToInt(edtMonthGen.Text)
     else
       ENFuelDistributionSheetFilterObj.monthGen := Low(Integer) ;




     if ( edtYearGen.Text <> '' ) then
       ENFuelDistributionSheetFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENFuelDistributionSheetFilterObj.yearGen := Low(Integer) ;




     if (ENFuelDistributionSheetFilterObj.totalSum = nil ) then
       ENFuelDistributionSheetFilterObj.totalSum := TXSDecimal.Create;
     if edtTotalSum.Text <> '' then
       ENFuelDistributionSheetFilterObj.totalSum.decimalString := edtTotalSum.Text 
     else
       ENFuelDistributionSheetFilterObj.totalSum := nil;




     if (ENFuelDistributionSheetFilterObj.sum1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum1 := TXSDecimal.Create;
     if edtSum1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum1.decimalString := edtSum1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum2 := TXSDecimal.Create;
     if edtSum2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum2.decimalString := edtSum2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum3 := TXSDecimal.Create;
     if edtSum3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum3.decimalString := edtSum3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum3 := nil;




     if (ENFuelDistributionSheetFilterObj.sum4 = nil ) then
       ENFuelDistributionSheetFilterObj.sum4 := TXSDecimal.Create;
     if edtSum4.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum4.decimalString := edtSum4.Text 
     else
       ENFuelDistributionSheetFilterObj.sum4 := nil;




     if (ENFuelDistributionSheetFilterObj.sum5 = nil ) then
       ENFuelDistributionSheetFilterObj.sum5 := TXSDecimal.Create;
     if edtSum5.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum5.decimalString := edtSum5.Text 
     else
       ENFuelDistributionSheetFilterObj.sum5 := nil;




     if (ENFuelDistributionSheetFilterObj.sum1dec1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum1dec1 := TXSDecimal.Create;
     if edtSum1dec1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum1dec1.decimalString := edtSum1dec1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum1dec1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum2dec1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum2dec1 := TXSDecimal.Create;
     if edtSum2dec1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum2dec1.decimalString := edtSum2dec1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum2dec1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum3dec1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum3dec1 := TXSDecimal.Create;
     if edtSum3dec1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum3dec1.decimalString := edtSum3dec1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum3dec1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum4dec1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum4dec1 := TXSDecimal.Create;
     if edtSum4dec1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum4dec1.decimalString := edtSum4dec1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum4dec1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum5dec1 = nil ) then
       ENFuelDistributionSheetFilterObj.sum5dec1 := TXSDecimal.Create;
     if edtSum5dec1.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum5dec1.decimalString := edtSum5dec1.Text 
     else
       ENFuelDistributionSheetFilterObj.sum5dec1 := nil;




     if (ENFuelDistributionSheetFilterObj.sum1dec2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum1dec2 := TXSDecimal.Create;
     if edtSum1dec2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum1dec2.decimalString := edtSum1dec2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum1dec2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum2dec2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum2dec2 := TXSDecimal.Create;
     if edtSum2dec2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum2dec2.decimalString := edtSum2dec2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum2dec2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum3dec2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum3dec2 := TXSDecimal.Create;
     if edtSum3dec2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum3dec2.decimalString := edtSum3dec2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum3dec2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum4dec2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum4dec2 := TXSDecimal.Create;
     if edtSum4dec2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum4dec2.decimalString := edtSum4dec2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum4dec2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum5dec2 = nil ) then
       ENFuelDistributionSheetFilterObj.sum5dec2 := TXSDecimal.Create;
     if edtSum5dec2.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum5dec2.decimalString := edtSum5dec2.Text 
     else
       ENFuelDistributionSheetFilterObj.sum5dec2 := nil;




     if (ENFuelDistributionSheetFilterObj.sum1dec3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum1dec3 := TXSDecimal.Create;
     if edtSum1dec3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum1dec3.decimalString := edtSum1dec3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum1dec3 := nil;




     if (ENFuelDistributionSheetFilterObj.sum2dec3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum2dec3 := TXSDecimal.Create;
     if edtSum2dec3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum2dec3.decimalString := edtSum2dec3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum2dec3 := nil;




     if (ENFuelDistributionSheetFilterObj.sum3dec3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum3dec3 := TXSDecimal.Create;
     if edtSum3dec3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum3dec3.decimalString := edtSum3dec3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum3dec3 := nil;




     if (ENFuelDistributionSheetFilterObj.sum4dec3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum4dec3 := TXSDecimal.Create;
     if edtSum4dec3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum4dec3.decimalString := edtSum4dec3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum4dec3 := nil;




     if (ENFuelDistributionSheetFilterObj.sum5dec3 = nil ) then
       ENFuelDistributionSheetFilterObj.sum5dec3 := TXSDecimal.Create;
     if edtSum5dec3.Text <> '' then
       ENFuelDistributionSheetFilterObj.sum5dec3.decimalString := edtSum5dec3.Text 
     else
       ENFuelDistributionSheetFilterObj.sum5dec3 := nil;




     ENFuelDistributionSheetFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelDistributionSheetFilterObj.dateEdit = nil then
          ENFuelDistributionSheetFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelDistributionSheetFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelDistributionSheetFilterObj.dateEdit := nil;




  end;
end;




end.
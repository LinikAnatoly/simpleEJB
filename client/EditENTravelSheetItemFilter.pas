
unit EditENTravelSheetItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemController ;

type
  TfrmENTravelSheetItemFilterEdit = class(TDialogForm)

    lblTravelFrom : TLabel;
    edtTravelFrom: TEdit;

    lblTravelTo : TLabel;
    edtTravelTo: TEdit;

    lblTimeStart : TLabel;
    edtTimeStart: TDateTimePicker;
    lblTimeFinal : TLabel;
    edtTimeFinal: TDateTimePicker;
    lblSpeedometerStart : TLabel;
    edtSpeedometerStart: TEdit;

    lblSpeedometerFinal : TLabel;
    edtSpeedometerFinal: TEdit;

    lblSumDistances : TLabel;
    edtSumDistances: TEdit;

    lblSumMachineHours : TLabel;
    edtSumMachineHours: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;



  HTTPRIOENTravelSheetItem: THTTPRIO;

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
  frmENTravelSheetItemFilterEdit: TfrmENTravelSheetItemFilterEdit;
  ENTravelSheetItemFilterObj: ENTravelSheetItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSumDistances
      ,edtSumMachineHours
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtTravelFrom.Text := ENTravelSheetItemObj.travelFrom; 



    edtTravelTo.Text := ENTravelSheetItemObj.travelTo; 



      if ENTravelSheetItemObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:=EncodeDate(ENTravelSheetItemObj.timeStart.Year,ENTravelSheetItemObj.timeStart.Month,ENTravelSheetItemObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;	  



      if ENTravelSheetItemObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:=EncodeDate(ENTravelSheetItemObj.timeFinal.Year,ENTravelSheetItemObj.timeFinal.Month,ENTravelSheetItemObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;	  



    if ( ENTravelSheetItemObj.speedometerStart <> nil ) then
       edtSpeedometerStart.Text := ENTravelSheetItemObj.speedometerStart.decimalString
    else
       edtSpeedometerStart.Text := ''; 



    if ( ENTravelSheetItemObj.speedometerFinal <> nil ) then
       edtSpeedometerFinal.Text := ENTravelSheetItemObj.speedometerFinal.decimalString
    else
       edtSpeedometerFinal.Text := ''; 



    if ( ENTravelSheetItemObj.sumDistances <> nil ) then
       edtSumDistances.Text := ENTravelSheetItemObj.sumDistances.decimalString
    else
       edtSumDistances.Text := ''; 



    if ( ENTravelSheetItemObj.sumMachineHours <> nil ) then
       edtSumMachineHours.Text := ENTravelSheetItemObj.sumMachineHours.decimalString
    else
       edtSumMachineHours.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENTravelSheetItemObj.commentGen);



      if ENTravelSheetItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTravelSheetItemObj.dateEdit.Year,ENTravelSheetItemObj.dateEdit.Month,ENTravelSheetItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := ENTravelSheetItemObj.userGen; 


  end;

}

end;



procedure TfrmENTravelSheetItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTravelSheetItemFilterObj.travelFrom := edtTravelFrom.Text; 



     ENTravelSheetItemFilterObj.travelTo := edtTravelTo.Text; 



     if edttimeStart.checked then
     begin 
       if ENTravelSheetItemFilterObj.timeStart = nil then
          ENTravelSheetItemFilterObj.timeStart := TXSDateTime.Create;
       ENTravelSheetItemFilterObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENTravelSheetItemFilterObj.timeStart := nil;



     if edttimeFinal.checked then
     begin 
       if ENTravelSheetItemFilterObj.timeFinal = nil then
          ENTravelSheetItemFilterObj.timeFinal := TXSDateTime.Create;
       ENTravelSheetItemFilterObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENTravelSheetItemFilterObj.timeFinal := nil;



     if (ENTravelSheetItemFilterObj.speedometerStart = nil ) then
       ENTravelSheetItemFilterObj.speedometerStart := TXSDecimal.Create;
     if edtSpeedometerStart.Text <> '' then
       ENTravelSheetItemFilterObj.speedometerStart.decimalString := edtSpeedometerStart.Text 
     else
       ENTravelSheetItemFilterObj.speedometerStart := nil;




     if (ENTravelSheetItemFilterObj.speedometerFinal = nil ) then
       ENTravelSheetItemFilterObj.speedometerFinal := TXSDecimal.Create;
     if edtSpeedometerFinal.Text <> '' then
       ENTravelSheetItemFilterObj.speedometerFinal.decimalString := edtSpeedometerFinal.Text 
     else
       ENTravelSheetItemFilterObj.speedometerFinal := nil;




     if (ENTravelSheetItemFilterObj.sumDistances = nil ) then
       ENTravelSheetItemFilterObj.sumDistances := TXSDecimal.Create;
     if edtSumDistances.Text <> '' then
       ENTravelSheetItemFilterObj.sumDistances.decimalString := edtSumDistances.Text 
     else
       ENTravelSheetItemFilterObj.sumDistances := nil;




     if (ENTravelSheetItemFilterObj.sumMachineHours = nil ) then
       ENTravelSheetItemFilterObj.sumMachineHours := TXSDecimal.Create;
     if edtSumMachineHours.Text <> '' then
       ENTravelSheetItemFilterObj.sumMachineHours.decimalString := edtSumMachineHours.Text 
     else
       ENTravelSheetItemFilterObj.sumMachineHours := nil;




     ENTravelSheetItemFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENTravelSheetItemFilterObj.dateEdit = nil then
          ENTravelSheetItemFilterObj.dateEdit := TXSDateTime.Create;
       ENTravelSheetItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTravelSheetItemFilterObj.dateEdit := nil;



     ENTravelSheetItemFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.
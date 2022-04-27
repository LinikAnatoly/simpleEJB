
unit EditENBonusListItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBonusListItemController ;

type
  TfrmENBonusListItemFilterEdit = class(TDialogForm)

    lblPodrId : TLabel;
    edtPodrId: TEdit;

    lblPodrName : TLabel;
    edtPodrName: TMemo;

    lblFio : TLabel;
    edtFio: TEdit;

    lblTabNumber : TLabel;
    edtTabNumber: TEdit;

    lblPositionName : TLabel;
    edtPositionName: TMemo;

    lblFundWorkTime : TLabel;
    edtFundWorkTime: TEdit;

    lblWorkTimeFact : TLabel;
    edtWorkTimeFact: TEdit;

    lblHoursWorkedWithStaff : TLabel;
    edtHoursWorkedWithStaff: TEdit;

    lblTimeDelivery : TLabel;
    edtTimeDelivery: TEdit;

    lblHoursWorkedPlan : TLabel;
    edtHoursWorkedPlan: TEdit;

    lblHoursWorkedNotPlan : TLabel;
    edtHoursWorkedNotPlan: TEdit;

    lblHoursWorkedSum : TLabel;
    edtHoursWorkedSum: TEdit;

    lblPercentLoadWork : TLabel;
    edtPercentLoadWork: TEdit;

    lblPercentLoadByPlanWork : TLabel;
    edtPercentLoadByPlanWork: TEdit;

    lblPercentLoadByNotPlanWork : TLabel;
    edtPercentLoadByNotPlanWork: TEdit;

    lblPercentBonus : TLabel;
    edtPercentBonus: TEdit;

    lblCoefficient : TLabel;
    edtCoefficient: TEdit;

    lblPercentBonusForCharging : TLabel;
    edtPercentBonusForCharging: TEdit;

    lblCountFactWorkedDays : TLabel;
    edtCountFactWorkedDays: TEdit;



  HTTPRIOENBonusListItem: THTTPRIO;

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
  frmENBonusListItemFilterEdit: TfrmENBonusListItemFilterEdit;
  ENBonusListItemFilterObj: ENBonusListItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBonusListItemController  ;
}
{$R *.dfm}



procedure TfrmENBonusListItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPodrId
      ,edtPodrName
      ,edtFio
      ,edtTabNumber
      ,edtPositionName
      ,edtFundWorkTime
      ,edtWorkTimeFact
      ,edtHoursWorkedWithStaff
      ,edtTimeDelivery
      ,edtHoursWorkedPlan
      ,edtHoursWorkedNotPlan
      ,edtHoursWorkedSum
      ,edtPercentLoadWork
      ,edtPercentLoadByPlanWork
      ,edtPercentLoadByNotPlanWork
      ,edtPercentBonus
      ,edtPercentBonusForCharging
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtPodrId.Text := ENBonusListItemObj.podrId; 



    MakeMultiline(edtPodrName.Lines, ENBonusListItemObj.podrName);



    edtFio.Text := ENBonusListItemObj.fio; 



    edtTabNumber.Text := ENBonusListItemObj.tabNumber; 



    MakeMultiline(edtPositionName.Lines, ENBonusListItemObj.positionName);



    if ( ENBonusListItemObj.fundWorkTime <> nil ) then
       edtFundWorkTime.Text := ENBonusListItemObj.fundWorkTime.decimalString
    else
       edtFundWorkTime.Text := ''; 



    if ( ENBonusListItemObj.workTimeFact <> nil ) then
       edtWorkTimeFact.Text := ENBonusListItemObj.workTimeFact.decimalString
    else
       edtWorkTimeFact.Text := ''; 



    if ( ENBonusListItemObj.hoursWorkedWithStaff <> nil ) then
       edtHoursWorkedWithStaff.Text := ENBonusListItemObj.hoursWorkedWithStaff.decimalString
    else
       edtHoursWorkedWithStaff.Text := ''; 



    if ( ENBonusListItemObj.timeDelivery <> nil ) then
       edtTimeDelivery.Text := ENBonusListItemObj.timeDelivery.decimalString
    else
       edtTimeDelivery.Text := ''; 



    if ( ENBonusListItemObj.hoursWorkedPlan <> nil ) then
       edtHoursWorkedPlan.Text := ENBonusListItemObj.hoursWorkedPlan.decimalString
    else
       edtHoursWorkedPlan.Text := ''; 



    if ( ENBonusListItemObj.hoursWorkedNotPlan <> nil ) then
       edtHoursWorkedNotPlan.Text := ENBonusListItemObj.hoursWorkedNotPlan.decimalString
    else
       edtHoursWorkedNotPlan.Text := ''; 



    if ( ENBonusListItemObj.hoursWorkedSum <> nil ) then
       edtHoursWorkedSum.Text := ENBonusListItemObj.hoursWorkedSum.decimalString
    else
       edtHoursWorkedSum.Text := ''; 



    if ( ENBonusListItemObj.percentLoadWork <> nil ) then
       edtPercentLoadWork.Text := ENBonusListItemObj.percentLoadWork.decimalString
    else
       edtPercentLoadWork.Text := ''; 



    if ( ENBonusListItemObj.percentLoadByPlanWork <> nil ) then
       edtPercentLoadByPlanWork.Text := ENBonusListItemObj.percentLoadByPlanWork.decimalString
    else
       edtPercentLoadByPlanWork.Text := ''; 



    if ( ENBonusListItemObj.percentLoadByNotPlanWork <> nil ) then
       edtPercentLoadByNotPlanWork.Text := ENBonusListItemObj.percentLoadByNotPlanWork.decimalString
    else
       edtPercentLoadByNotPlanWork.Text := ''; 



    if ( ENBonusListItemObj.percentBonus <> nil ) then
       edtPercentBonus.Text := ENBonusListItemObj.percentBonus.decimalString
    else
       edtPercentBonus.Text := ''; 



    if ( ENBonusListItemObj.coefficient <> nil ) then
       edtCoefficient.Text := ENBonusListItemObj.coefficient.decimalString
    else
       edtCoefficient.Text := ''; 



    if ( ENBonusListItemObj.percentBonusForCharging <> nil ) then
       edtPercentBonusForCharging.Text := ENBonusListItemObj.percentBonusForCharging.decimalString
    else
       edtPercentBonusForCharging.Text := ''; 



    if ( ENBonusListItemObj.countFactWorkedDays <> nil ) then
       edtCountFactWorkedDays.Text := ENBonusListItemObj.countFactWorkedDays.decimalString
    else
       edtCountFactWorkedDays.Text := ''; 


  end;

}

end;



procedure TfrmENBonusListItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBonusListItemFilterObj.podrId := edtPodrId.Text; 



     ENBonusListItemFilterObj.podrName := edtPodrName.Text; 



     ENBonusListItemFilterObj.fio := edtFio.Text; 



     ENBonusListItemFilterObj.tabNumber := edtTabNumber.Text; 



     ENBonusListItemFilterObj.positionName := edtPositionName.Text; 



     if (ENBonusListItemFilterObj.fundWorkTime = nil ) then
       ENBonusListItemFilterObj.fundWorkTime := TXSDecimal.Create;
     if edtFundWorkTime.Text <> '' then
       ENBonusListItemFilterObj.fundWorkTime.decimalString := edtFundWorkTime.Text 
     else
       ENBonusListItemFilterObj.fundWorkTime := nil;




     if (ENBonusListItemFilterObj.workTimeFact = nil ) then
       ENBonusListItemFilterObj.workTimeFact := TXSDecimal.Create;
     if edtWorkTimeFact.Text <> '' then
       ENBonusListItemFilterObj.workTimeFact.decimalString := edtWorkTimeFact.Text 
     else
       ENBonusListItemFilterObj.workTimeFact := nil;




     if (ENBonusListItemFilterObj.hoursWorkedWithStaff = nil ) then
       ENBonusListItemFilterObj.hoursWorkedWithStaff := TXSDecimal.Create;
     if edtHoursWorkedWithStaff.Text <> '' then
       ENBonusListItemFilterObj.hoursWorkedWithStaff.decimalString := edtHoursWorkedWithStaff.Text 
     else
       ENBonusListItemFilterObj.hoursWorkedWithStaff := nil;




     if (ENBonusListItemFilterObj.timeDelivery = nil ) then
       ENBonusListItemFilterObj.timeDelivery := TXSDecimal.Create;
     if edtTimeDelivery.Text <> '' then
       ENBonusListItemFilterObj.timeDelivery.decimalString := edtTimeDelivery.Text 
     else
       ENBonusListItemFilterObj.timeDelivery := nil;




     if (ENBonusListItemFilterObj.hoursWorkedPlan = nil ) then
       ENBonusListItemFilterObj.hoursWorkedPlan := TXSDecimal.Create;
     if edtHoursWorkedPlan.Text <> '' then
       ENBonusListItemFilterObj.hoursWorkedPlan.decimalString := edtHoursWorkedPlan.Text 
     else
       ENBonusListItemFilterObj.hoursWorkedPlan := nil;




     if (ENBonusListItemFilterObj.hoursWorkedNotPlan = nil ) then
       ENBonusListItemFilterObj.hoursWorkedNotPlan := TXSDecimal.Create;
     if edtHoursWorkedNotPlan.Text <> '' then
       ENBonusListItemFilterObj.hoursWorkedNotPlan.decimalString := edtHoursWorkedNotPlan.Text 
     else
       ENBonusListItemFilterObj.hoursWorkedNotPlan := nil;




     if (ENBonusListItemFilterObj.hoursWorkedSum = nil ) then
       ENBonusListItemFilterObj.hoursWorkedSum := TXSDecimal.Create;
     if edtHoursWorkedSum.Text <> '' then
       ENBonusListItemFilterObj.hoursWorkedSum.decimalString := edtHoursWorkedSum.Text 
     else
       ENBonusListItemFilterObj.hoursWorkedSum := nil;




     if (ENBonusListItemFilterObj.percentLoadWork = nil ) then
       ENBonusListItemFilterObj.percentLoadWork := TXSDecimal.Create;
     if edtPercentLoadWork.Text <> '' then
       ENBonusListItemFilterObj.percentLoadWork.decimalString := edtPercentLoadWork.Text 
     else
       ENBonusListItemFilterObj.percentLoadWork := nil;




     if (ENBonusListItemFilterObj.percentLoadByPlanWork = nil ) then
       ENBonusListItemFilterObj.percentLoadByPlanWork := TXSDecimal.Create;
     if edtPercentLoadByPlanWork.Text <> '' then
       ENBonusListItemFilterObj.percentLoadByPlanWork.decimalString := edtPercentLoadByPlanWork.Text 
     else
       ENBonusListItemFilterObj.percentLoadByPlanWork := nil;




     if (ENBonusListItemFilterObj.percentLoadByNotPlanWork = nil ) then
       ENBonusListItemFilterObj.percentLoadByNotPlanWork := TXSDecimal.Create;
     if edtPercentLoadByNotPlanWork.Text <> '' then
       ENBonusListItemFilterObj.percentLoadByNotPlanWork.decimalString := edtPercentLoadByNotPlanWork.Text 
     else
       ENBonusListItemFilterObj.percentLoadByNotPlanWork := nil;




     if (ENBonusListItemFilterObj.percentBonus = nil ) then
       ENBonusListItemFilterObj.percentBonus := TXSDecimal.Create;
     if edtPercentBonus.Text <> '' then
       ENBonusListItemFilterObj.percentBonus.decimalString := edtPercentBonus.Text 
     else
       ENBonusListItemFilterObj.percentBonus := nil;




     if (ENBonusListItemFilterObj.coefficient = nil ) then
       ENBonusListItemFilterObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENBonusListItemFilterObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENBonusListItemFilterObj.coefficient := nil;




     if (ENBonusListItemFilterObj.percentBonusForCharging = nil ) then
       ENBonusListItemFilterObj.percentBonusForCharging := TXSDecimal.Create;
     if edtPercentBonusForCharging.Text <> '' then
       ENBonusListItemFilterObj.percentBonusForCharging.decimalString := edtPercentBonusForCharging.Text 
     else
       ENBonusListItemFilterObj.percentBonusForCharging := nil;




     if (ENBonusListItemFilterObj.countFactWorkedDays = nil ) then
       ENBonusListItemFilterObj.countFactWorkedDays := TXSDecimal.Create;
     if edtCountFactWorkedDays.Text <> '' then
       ENBonusListItemFilterObj.countFactWorkedDays.decimalString := edtCountFactWorkedDays.Text 
     else
       ENBonusListItemFilterObj.countFactWorkedDays := nil;





  end;
end;




end.
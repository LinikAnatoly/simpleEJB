
unit EditENBonusListItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBonusListItemController ;

type
  TfrmENBonusListItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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

  btnOk: TButton;
  btnCancel: TButton;
    lblTradeCategoryId: TLabel;
    edtTradeCategoryId: TEdit;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal: TLabel;
    edtDateFinal: TDateTimePicker;
    edtPositionId: TEdit;
    lblPositionId: TLabel;
    HTTPRIOENBonusListItem: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBonusListItemEdit: TfrmENBonusListItemEdit;
  ENBonusListItemObj: ENBonusListItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBonusListItemController  ;
}
{$R *.dfm}



procedure TfrmENBonusListItemEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);
  SetFloatStyle([edtFundWorkTime , edtWorkTimeFact , edtHoursWorkedWithStaff
  , edtTimeDelivery , edtHoursWorkedPlan , edtHoursWorkedNotPlan
  , edtHoursWorkedSum , edtPercentLoadWork , edtPercentLoadByPlanWork
  , edtPercentLoadByNotPlanWork , edtPercentBonus , edtCoefficient , edtPercentBonusForCharging
  , edtCountFactWorkedDays ]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPodrId
      ,edtPodrName
      ,edtFio
      ,edtTabNumber
      ,edtPositionId
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
      ,edtDateFinal
      ,edtDateStart
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBonusListItemObj.code);
    edtPodrId.Text := ENBonusListItemObj.podrId; 
    MakeMultiline(edtPodrName.Lines, ENBonusListItemObj.podrName);
    edtFio.Text := ENBonusListItemObj.fio; 
    edtTabNumber.Text := ENBonusListItemObj.tabNumber;
    edtPositionId.Text := ENBonusListItemObj.positionId ;
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

    edtTradeCategoryId.Text := ENBonusListItemObj.tradeCategoryId;

    if ENBonusListItemObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENBonusListItemObj.dateStart.Year,ENBonusListItemObj.dateStart.Month,ENBonusListItemObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;

    if ENBonusListItemObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENBonusListItemObj.dateFinal.Year,ENBonusListItemObj.dateFinal.Month,ENBonusListItemObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;


  end;
end;



procedure TfrmENBonusListItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
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
      ,edtDateFinal
      ,edtDateStart
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;

     if ENBonusListItemObj.noWayOutFromPeriod = nil then
     ENBonusListItemObj.noWayOutFromPeriod := TXSDecimal.Create;
     if ENBonusListItemObj.noWayOutFromPeriod.DecimalString <> '' then
      ENBonusListItemObj.noWayOutFromPeriod.DecimalString := ENBonusListItemObj.noWayOutFromPeriod.DecimalString
     else
      ENBonusListItemObj.noWayOutFromPeriod.DecimalString := '0';



     ENBonusListItemObj.podrId := edtPodrId.Text; 

     ENBonusListItemObj.podrName := edtPodrName.Text; 

     ENBonusListItemObj.fio := edtFio.Text; 

     ENBonusListItemObj.tabNumber := edtTabNumber.Text; 

     ENBonusListItemObj.positionId := edtPositionId.Text;

     ENBonusListItemObj.positionName := edtPositionName.Text; 

     if (ENBonusListItemObj.fundWorkTime = nil ) then
       ENBonusListItemObj.fundWorkTime := TXSDecimal.Create;
     if edtFundWorkTime.Text <> '' then
       ENBonusListItemObj.fundWorkTime.decimalString := edtFundWorkTime.Text
     else
       ENBonusListItemObj.fundWorkTime := nil;

     if (ENBonusListItemObj.workTimeFact = nil ) then
       ENBonusListItemObj.workTimeFact := TXSDecimal.Create;
     if edtWorkTimeFact.Text <> '' then
       ENBonusListItemObj.workTimeFact.decimalString := edtWorkTimeFact.Text 
     else
       ENBonusListItemObj.workTimeFact := nil;

     if (ENBonusListItemObj.hoursWorkedWithStaff = nil ) then
       ENBonusListItemObj.hoursWorkedWithStaff := TXSDecimal.Create;
     if edtHoursWorkedWithStaff.Text <> '' then
       ENBonusListItemObj.hoursWorkedWithStaff.decimalString := edtHoursWorkedWithStaff.Text 
     else
       ENBonusListItemObj.hoursWorkedWithStaff := nil;

     if (ENBonusListItemObj.timeDelivery = nil ) then
       ENBonusListItemObj.timeDelivery := TXSDecimal.Create;
     if edtTimeDelivery.Text <> '' then
       ENBonusListItemObj.timeDelivery.decimalString := edtTimeDelivery.Text 
     else
       ENBonusListItemObj.timeDelivery := nil;

     if (ENBonusListItemObj.hoursWorkedPlan = nil ) then
       ENBonusListItemObj.hoursWorkedPlan := TXSDecimal.Create;
     if edtHoursWorkedPlan.Text <> '' then
       ENBonusListItemObj.hoursWorkedPlan.decimalString := edtHoursWorkedPlan.Text 
     else
       ENBonusListItemObj.hoursWorkedPlan := nil;

     if (ENBonusListItemObj.hoursWorkedNotPlan = nil ) then
       ENBonusListItemObj.hoursWorkedNotPlan := TXSDecimal.Create;
     if edtHoursWorkedNotPlan.Text <> '' then
       ENBonusListItemObj.hoursWorkedNotPlan.decimalString := edtHoursWorkedNotPlan.Text 
     else
       ENBonusListItemObj.hoursWorkedNotPlan := nil;

     if (ENBonusListItemObj.hoursWorkedSum = nil ) then
       ENBonusListItemObj.hoursWorkedSum := TXSDecimal.Create;
     if edtHoursWorkedSum.Text <> '' then
       ENBonusListItemObj.hoursWorkedSum.decimalString := edtHoursWorkedSum.Text 
     else
       ENBonusListItemObj.hoursWorkedSum := nil;

     if (ENBonusListItemObj.percentLoadWork = nil ) then
       ENBonusListItemObj.percentLoadWork := TXSDecimal.Create;
     if edtPercentLoadWork.Text <> '' then
       ENBonusListItemObj.percentLoadWork.decimalString := edtPercentLoadWork.Text 
     else
       ENBonusListItemObj.percentLoadWork := nil;

     if (ENBonusListItemObj.percentLoadByPlanWork = nil ) then
       ENBonusListItemObj.percentLoadByPlanWork := TXSDecimal.Create;
     if edtPercentLoadByPlanWork.Text <> '' then
       ENBonusListItemObj.percentLoadByPlanWork.decimalString := edtPercentLoadByPlanWork.Text 
     else
       ENBonusListItemObj.percentLoadByPlanWork := nil;

     if (ENBonusListItemObj.percentLoadByNotPlanWork = nil ) then
       ENBonusListItemObj.percentLoadByNotPlanWork := TXSDecimal.Create;
     if edtPercentLoadByNotPlanWork.Text <> '' then
       ENBonusListItemObj.percentLoadByNotPlanWork.decimalString := edtPercentLoadByNotPlanWork.Text 
     else
       ENBonusListItemObj.percentLoadByNotPlanWork := nil;

     if (ENBonusListItemObj.percentBonus = nil ) then
       ENBonusListItemObj.percentBonus := TXSDecimal.Create;
     if edtPercentBonus.Text <> '' then
       ENBonusListItemObj.percentBonus.decimalString := edtPercentBonus.Text 
     else
       ENBonusListItemObj.percentBonus := nil;

     if (ENBonusListItemObj.coefficient = nil ) then
       ENBonusListItemObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENBonusListItemObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENBonusListItemObj.coefficient := nil;

     if (ENBonusListItemObj.percentBonusForCharging = nil ) then
       ENBonusListItemObj.percentBonusForCharging := TXSDecimal.Create;
     if edtPercentBonusForCharging.Text <> '' then
       ENBonusListItemObj.percentBonusForCharging.decimalString := edtPercentBonusForCharging.Text 
     else
       ENBonusListItemObj.percentBonusForCharging := nil;

     if (ENBonusListItemObj.countFactWorkedDays = nil ) then
       ENBonusListItemObj.countFactWorkedDays := TXSDecimal.Create;
     if edtCountFactWorkedDays.Text <> '' then
       ENBonusListItemObj.countFactWorkedDays.decimalString := edtCountFactWorkedDays.Text 
     else
       ENBonusListItemObj.countFactWorkedDays := nil;


       ENBonusListItemObj.tradeCategoryId := edtTradeCategoryId.Text;

     if edtDateStart.checked then
     begin
       if ENBonusListItemObj.dateStart = nil then
          ENBonusListItemObj.dateStart := TXSDate.Create;
          ENBonusListItemObj.dateStart.XSToNative(GetXSDate(edtDateStart.DateTime));
     end
     else
       ENBonusListItemObj.dateStart := nil;

     if edtDateFinal.checked then
     begin
       if ENBonusListItemObj.dateFinal = nil then
          ENBonusListItemObj.dateFinal := TXSDate.Create;
          ENBonusListItemObj.dateFinal.XSToNative(GetXSDate(edtDateFinal.DateTime));
     end
     else
       ENBonusListItemObj.dateFinal := nil;

    if DialogState = dsInsert then
    begin
      ENBonusListItemObj.code:=low(Integer);
      TempENBonusListItem.add(ENBonusListItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBonusListItem.save(ENBonusListItemObj);
    end;
  end;
end;


end.
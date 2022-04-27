unit EditChangePlanReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ENElementTypeController;

type
  TfrmChangePlanReasonEdit = class(TDialogForm)
    btnCancel: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    gbReason: TGroupBox;
    spbReason: TSpeedButton;
    spbReasonClear: TSpeedButton;
    edtReason: TEdit;
    HTTPRIOENPlanWork2PlanWorkReason: THTTPRIO;
    HTTPRIOENPlanWorkReason: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbReasonClick(Sender: TObject);
    procedure spbReasonClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planCode: Integer;
  end;

var
  frmChangePlanReasonEdit: TfrmChangePlanReasonEdit;

implementation

uses ENElementController, ENPlanWorkController, ENConsts, ShowENElement,
  ChildFormUnit, ShowENPlanWorkState, ENPlanWorkStateController,
  ENPlanWork2PlanWorkReasonController, ENPlanWorkReasonController,
  ShowENPlanWorkReason;

{$R *.dfm}

procedure TfrmChangePlanReasonEdit.FormCreate(Sender: TObject);
begin
  planCode := LOW_INT;
end;


procedure TfrmChangePlanReasonEdit.FormShow(Sender: TObject);
var
  TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
  ENPlanWorkReasonList : ENPlanWorkReasonShortList;
  ENPlanWorkReasonFilterObj : ENPlanWorkReasonFilter;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;

begin
  // Пока спрячем
  DisableControls([edtReason]);
  DenyBlankValues([edtReason]);

  if planCode = LOW_INT then
    //Exit;
    raise Exception.Create('NET-4337 Не вказано код плану!');

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkObj := TempENPlanWork.getObject(planCode);

  if ENPlanWorkObj = nil then
    raise Exception.Create('NET-4337 План не знайдено! Код плану: ' + IntToStr(planCode));

     ENPlanWorkReasonFilterObj := ENPlanWorkReasonFilter.Create;
     SetNullIntProps(ENPlanWorkReasonFilterObj);
     SetNullXSProps(ENPlanWorkReasonFilterObj);
     ENPlanWorkReasonFilterObj.conditionSQL := 'code in (select q.planworkreasonrefcode from enplanwork2planworkrsn q where q.planrefcode = '+ IntToStr(ENPlanWorkObj.code) +')';
     TempENPlanWorkReason :=  HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
     ENPlanWorkReasonList := TempENPlanWorkReason.getScrollableFilteredList(ENPlanWorkReasonFilterObj, 0, -1);
     if  ENPlanWorkReasonList.totalCount > 0 then
     begin
        edtReason.Text :=  ENPlanWorkReasonList.list[0].reasonTypeName + ' №' + ENPlanWorkReasonList.list[0].numberGen + ' від ' + XSDate2String(ENPlanWorkReasonList.list[0].dateGen) + '(' + ENPlanWorkReasonList.list[0].managementName + ')';
     end;

end;

procedure TfrmChangePlanReasonEdit.spbReasonClearClick(Sender: TObject);
var
  TempENPlanWork2PlanWorkReason: ENPlanWork2PlanWorkReasonControllerSoapPort;
  p2prFilter : ENPlanWork2PlanWorkReasonFilter;
  p2prArr : ENPlanWork2PlanWorkReasonController.ArrayOfInteger;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;
begin

    if planCode = LOW_INT then
    raise Exception.Create('NET-4337 Не вказано код плану!');

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if ENPlanWorkObj = nil then
    raise Exception.Create('NET-4337 План не знайдено! Код плану: ' + IntToStr(planCode));

     TempENPlanWork2PlanWorkReason := HTTPRIOENPlanWork2PlanWorkReason as ENPlanWork2PlanWorkReasonControllerSoapPort;
     p2prFilter :=  ENPlanWork2PlanWorkReasonFilter.Create;
     SetNullIntProps(p2prFilter);
     SetNullXSProps(p2prFilter);

     p2prFilter.planRef := ENPlanWorkRef.Create;
     p2prFilter.planRef.code := ENPlanWorkObj.code;
     p2prArr := TempENPlanWork2PlanWorkReason.getScrollableFilteredCodeArray(p2prFilter, 0, -1);
     if High(p2prArr) > -1 then
       TempENPlanWork2PlanWorkReason.remove(p2prArr[0]);

     edtReason.Text := '';
end;

procedure TfrmChangePlanReasonEdit.spbReasonClick(Sender: TObject);
Var
TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
TempENPlanWork2PlanWorkReason: ENPlanWork2PlanWorkReasonControllerSoapPort;
p2prList : ENPlanWork2PlanWorkReasonShortList;
p2prFilter : ENPlanWork2PlanWorkReasonFilter;
reason2Plan : ENPlanWork2PlanWorkReason;
p2prArr : ENPlanWork2PlanWorkReasonController.ArrayOfInteger;
frmENPlanWorkReasonShow : TfrmENPlanWorkReasonShow;
TempENPlanWork: ENPlanWorkControllerSoapPort;
ENPlanWorkObj: ENPlanWork;

begin

    if planCode = LOW_INT then
    raise Exception.Create('NET-4337 Не вказано код плану!');

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if ENPlanWorkObj = nil then
    raise Exception.Create('NET-4337 План не знайдено! Код плану: ' + IntToStr(planCode));

  TempENPlanWork2PlanWorkReason := HTTPRIOENPlanWork2PlanWorkReason as ENPlanWork2PlanWorkReasonControllerSoapPort;
  if (edtReason.Text = '') then
  begin
     reason2Plan :=  ENPlanWork2PlanWorkReason.Create;
     SetNullIntProps(reason2Plan);
     SetNullXSProps(reason2Plan);
     reason2Plan.planRef := ENPlanWorkRef.Create;
     reason2Plan.planRef.code := ENPlanWorkObj.code;
  end
  else
  begin
     p2prFilter := ENPlanWork2PlanWorkReasonFilter.Create;
     SetNullIntProps(p2prFilter);
     SetNullXSProps(p2prFilter);
     p2prFilter.planRef := ENPlanWorkRef.Create;
     p2prFilter.planRef.code := ENPlanWorkObj.code;
     p2prArr := TempENPlanWork2PlanWorkReason.getScrollableFilteredCodeArray(p2prFilter, 0, -1);
     if High(p2prArr) > -1 then
     begin
         reason2Plan := TempENPlanWork2PlanWorkReason.getObject(p2prArr[0]);
     end;

  end;


  frmENPlanWorkReasonShow := TfrmENPlanWorkReasonShow.Create(Application, fmNormal);
  try

    if  frmENPlanWorkReasonShow.ShowModal = mrOK then
    begin
        reason2Plan.planWorkReasonRef := ENPlanWorkReasonRef.Create;
        reason2Plan.planWorkReasonRef.code :=  StrToInt(frmENPlanWorkReasonShow.GetReturnValue(frmENPlanWorkReasonShow.sgENPlanWorkReason,0));

        if reason2Plan.code = LOW_INT then
           TempENPlanWork2PlanWorkReason.add(reason2Plan)
        else
           TempENPlanWork2PlanWorkReason.save(reason2Plan);

        edtReason.Text := frmENPlanWorkReasonShow.GetReturnValue(frmENPlanWorkReasonShow.sgENPlanWorkReason,4) + ' №' + frmENPlanWorkReasonShow.GetReturnValue(frmENPlanWorkReasonShow.sgENPlanWorkReason,2) + ' від ' + frmENPlanWorkReasonShow.GetReturnValue(frmENPlanWorkReasonShow.sgENPlanWorkReason,1) + '(' + frmENPlanWorkReasonShow.GetReturnValue(frmENPlanWorkReasonShow.sgENPlanWorkReason,5) + ')';
    end;

  finally
     frmENPlanWorkReasonShow.Free;
  end;

end;

end.

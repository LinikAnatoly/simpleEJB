unit EditRecalcDistanceServicesConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ENPlanWork2ClassificationTypeController,
  InvokeRegistry, Rio, XSBuiltIns, SOAPHTTPClient, ENConsts, ExtCtrls,
  Grids, BaseGrid, AdvGrid, GridHeadersUnit, Planner, ComCtrls, ENServicesObjectController;

type
  TfrmRecalcDistanceServicesConnectionEdit = class(TDialogForm)
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOTKClassificationType: THTTPRIO;
    lblDistance: TLabel;
    edtDistance: TEdit;
    HTTPRIOTKTechCard: THTTPRIO;
    HTTPRIOTKTransport: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    isJobsByTime : Boolean;
    isVisitClient : Boolean;
  public
    { Public declarations }
    distance: TXSDecimal;
    machinehours : TXSDecimal;
    isLicensed : Integer;
    relocationKm : TXSDecimal;
    transportationLoad  : TXSDecimal;
    tktransporttype : Integer;
    codeDepartmentForServicesObject : Integer;
    priconnections : Boolean;
    sObj : ENServicesObject;
  end;

var
  frmRecalcDistanceServicesConnectionEdit: TfrmRecalcDistanceServicesConnectionEdit;
  classificationTypeObj: ENPlanWork2ClassificationType;

implementation

uses ShowTKClassificationType, TKClassificationTypeController,
  ChildFormUnit, ENPlanWorkItemController, 
  EditENServicesCalculation, ENPlanWorkController, TKTechCardController, TKTransportController,
  TKTechCardSourceController , ShowENDepartment , ENDepartmentController , TKClassification2ENDepartmentController , TKVirtualBrigadeController;

{$R *.dfm}


procedure TfrmRecalcDistanceServicesConnectionEdit.FormShow(Sender: TObject);
var
  ii , ti : Integer;

  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  classificationType: TKClassificationType;

  TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
  plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
  ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;

  TempTKTransport: TKTransportControllerSoapPort;
  TKTransportList: TKTransportShortList;
  ftranspfilter : TKTransportFilter;

  f  : TKTechCardFilter;
  c: TKTechCardControllerSoapPort;
  TKTechCardList , tempList : TKTechCardShortList;
  TempTKTechCard: TKTechCardControllerSoapPort;

  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkFilterObj: ENPlanWorkFilter;
  ENPlanWorkList: ENPlanWorkShortList;

begin

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtDistance]);
    SetFloatStyle(edtDistance);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtDistance.Text := distance.DecimalString;

    if priconnections then
    begin
      if (classificationTypeObj.classificationTypeRef <> nil) and (priconnections) then
      begin
        TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
        classificationType := TempTKClassificationType.getObject(classificationTypeObj.classificationTypeRef.code);

        // проверка какие виды работы в плане (лицензированные или нет)
        if classificationTypeObj.planRef.code > LOW_INT then
        begin
         // Проверить на вид работы (лицензированные или нет) если новая добавляемая не равна уже добавленым по виду работы то не давать выбирать работу .
         if isLicensed = LOW_INT then isLicensed := 0;

          TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

          plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
          SetNullIntProps(plan2ctFilter);
          SetNullXSProps(plan2ctFilter);

          plan2ctFilter.planRef := ENPlanWorkRef.Create;
          plan2ctFilter.planRef.code := classificationTypeObj.planRef.code;
          plan2ctFilter.conditionSQL := 'classificationtyperfcd in ' +
                                        '(select ct.code from tkclassificationtype ct ' +
                                        '  where coalesce(ct.isnotlicensedactivity, 0) <> ' +
                                        IntToStr(1) + ') ';

          ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

          if High(ENPlanWork2ClassificationTypeList.list) > -1 then
             isLicensed := 0 // если не нашли по фильтру работы лицензированные тогда перерменной присвоим признак того что работы в этом дог лецензированые
          else
             isLicensed := 1;
        end;
      end;
    end;
  end;
end;


procedure TfrmRecalcDistanceServicesConnectionEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
    TempENPlanWork2ClassificationType : ENPlanWork2ClassificationTypeControllerSoapPort;
    TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
    TempENServicesObject : ENServicesObjectControllerSoapPort;
    condition : String;
    i : Integer;
    isCondition : boolean;
begin
	if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtDistance])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
    Exit;
  end
  else
  begin

    if priconnections then
    begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      try
        sObj.contractServicesDistance.DecimalString := edtDistance.Text;
        TempENServicesObject.save(sObj);
      except
        on EConvertError do Exit;
      end;

      distance.DecimalString := edtDistance.Text;

      if distance = nil then
      begin
        Application.MessageBox(PChar('Введіть відстань для розрахунку транспортних витрат (якщо транспорт не потрібний, введіть 0)!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Action := caNone;
        Exit;
      end;

      TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

      if (isLicensed = 0) then  // если лицензированная работа
      begin
          if DialogState = dsEdit then
          begin
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculation2(classificationTypeObj, distance , codeDepartmentForServicesObject, priconnections);
          end;
      end;

      if (isLicensed <> 0) then  // если не лицензированная работа
      begin
        relocationKm := TXSDecimal.Create;
        transportationLoad := TXSDecimal.Create;
        relocationKm := classificationTypeObj.relocationKm;
        transportationLoad := classificationTypeObj.transportationLoad;

          if relocationKm <> nil
          then
          distance :=  relocationKm;

          if transportationLoad <> nil
          then
          distance :=  transportationLoad;

          if DialogState = dsEdit then
          begin
            TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(classificationTypeObj, distance , machinehours , codeDepartmentForServicesObject, priconnections);
          end;
      end;

    end else
      distance.DecimalString := edtDistance.Text;

   end;
end;


procedure TfrmRecalcDistanceServicesConnectionEdit.FormCreate(Sender: TObject);
begin
  priconnections := True;
end;


end.

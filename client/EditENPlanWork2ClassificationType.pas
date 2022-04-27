unit EditENPlanWork2ClassificationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ENPlanWork2ClassificationTypeController,
  InvokeRegistry, Rio, XSBuiltIns, SOAPHTTPClient, ENConsts, ExtCtrls,
  Grids, BaseGrid, AdvGrid, GridHeadersUnit, Planner, ComCtrls, AdvObj;

type
  TfrmENPlanWork2ClassificationTypeEdit = class(TDialogForm)
    lblCountGen: TLabel;
    lblKarta: TLabel;
    lblMeasure: TLabel;
    Label1: TLabel;
    edtCountGen: TEdit;
    edtTKClassificationTypeName: TEdit;
    edtTKClassificationTypeKod: TEdit;
    spbTKClassificationType: TSpeedButton;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    HTTPRIOENPlanWork2ClassificationType: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOTKClassificationType: THTTPRIO;
    lblMachineHours: TLabel;
    edtMachineHours: TEdit;
    lblRelocationKm: TLabel;
    edtRelocationKm: TEdit;
    lblTransportationLoad: TLabel;
    edtTransportationLoad: TEdit;
    HTTPRIOTKTechCard: THTTPRIO;
    HTTPRIOTKTransport: THTTPRIO;
    grpIsPrintOnKmOrMh: TRadioGroup;
    sgTKTechCard: TAdvStringGrid;
    gbIsShowOperations: TGroupBox;
    cbIsShowOperation: TCheckBox;
    lblCostWorksContractor: TLabel;
    edtCostWorksContractor: TEdit;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOTKClassification2ENDepartment: THTTPRIO;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    btnENDepartmentDepartment: TSpeedButton;
    edtDepartmentForServices: TEdit;
    lbl8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKClassificationTypeClick(Sender: TObject);
    procedure edtMachineHoursChange(Sender: TObject);
    procedure edtTransportationLoadChange(Sender: TObject);
    procedure cbIsShowOperationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnENDepartmentDepartmentClick(Sender: TObject);
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
    isTechCondition : Boolean;
    tcsCode : Integer;
    customPlanDate : TXSDate;
    rent : Boolean;
    project : Boolean;
    guard : Boolean;
  end;

var
  frmENPlanWork2ClassificationTypeEdit: TfrmENPlanWork2ClassificationTypeEdit;
  ENPlanWork2ClassificationTypeObj: ENPlanWork2ClassificationType;

implementation

uses ShowTKClassificationType, TKClassificationTypeController,
  ChildFormUnit, ENPlanWorkItemController, 
  EditENServicesCalculation, ENPlanWorkController, TKTechCardController, TKTransportController,
  TKTechCardSourceController , ShowENDepartment , ENDepartmentController , TKClassification2ENDepartmentController , TKVirtualBrigadeController,
  DMReportsUnit, ENSettingsConsts;

{$R *.dfm}

var
  ColCount, LastCount : Integer;
  LastRow : Integer = 1;
  TKTechCardHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер операции'
          ,'Наименование операции'
          ,'Норма времени'
          ,'Меры безопасности'
          ,'Дата создания'
          ,'Дата с'
          ,'Дата по'
          ,'Условия труда'
        );



procedure TfrmENPlanWork2ClassificationTypeEdit.FormShow(Sender: TObject);
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

  



  gbIsShowOperations.Visible := False;
  sgTKTechCard.Visible := False;
  btnOk.Top := 190;
  btnCancel.Top := 190;
  Height := 255;

  HideControls([edtCostWorksContractor, lblCostWorksContractor]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtTKClassificationTypeKod, edtTKClassificationTypeName,edtCostWorksContractor ]);
    DenyBlankValues([edtTKClassificationTypeName, edtCountGen , edtMachineHours  ]);
    SetFloatStyle(edtCountGen);
    SetFloatStyle(edtMachineHours);
    SetFloatStyle(edtRelocationKm);
    SetFloatStyle(edtTransportationLoad);
    SetFloatStyle(edtCostWorksContractor);
  end;

  if DialogState = dsInsert then
   begin
    edtCountGen.Text := '1';
    edtMachineHours.Text := '0';
    DisableControls([grpIsPrintOnKmOrMh]);
    isJobsByTime:= False;
    isVisitClient:= False;

   end;

  // нефиг менять
  if DialogState = dsEdit then
    DisableControls([spbTKClassificationType]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    //edtCode.Text := IntToStr(ENPlanWork2ClassificationTypeObj.code);

    if ENPlanWork2ClassificationTypeObj.classificationTypeRef <> nil then
    begin
      TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
      classificationType := TempTKClassificationType.getObject(ENPlanWork2ClassificationTypeObj.classificationTypeRef.code);
      if classificationType <> nil then
      begin
        edtTKClassificationTypeKod.Text := classificationType.kod;
        edtTKClassificationTypeName.Text := classificationType.name;
        

        //////////////////////////////////
        //  стоимость работ подрядчика  //
        //////////////////////////////////
        if (classificationType.isnotlicensedactivity <> LOW_INT)
               and (classificationType.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR) then
           begin
              HideControls([edtCostWorksContractor, lblCostWorksContractor], False);
              DenyBlankValues([edtCostWorksContractor]);
              if (ENPlanWork2ClassificationTypeObj.costWorksContractor <> nil) then
                 edtCostWorksContractor.Text := ENPlanWork2ClassificationTypeObj.costWorksContractor.DecimalString
              else
                 edtCostWorksContractor.Text := '';
           end
      end;
    end;

    if (ENPlanWork2ClassificationTypeObj.countGen <> nil) then
      edtCountGen.Text := ENPlanWork2ClassificationTypeObj.countGen.DecimalString
    else
      edtCountGen.Text := '';

    edtCommentGen.Text := ENPlanWork2ClassificationTypeObj.commentGen;

    if ( ENPlanWork2ClassificationTypeObj.machineHours <> nil ) then
       edtMachineHours.Text := ENPlanWork2ClassificationTypeObj.machineHours.decimalString
    else
       edtMachineHours.Text := '';
    if ( ENPlanWork2ClassificationTypeObj.relocationKm <> nil ) then
       edtRelocationKm.Text := ENPlanWork2ClassificationTypeObj.relocationKm.decimalString
    else
       edtRelocationKm.Text := '';
    if ( ENPlanWork2ClassificationTypeObj.transportationLoad <> nil ) then
       edtTransportationLoad.Text := ENPlanWork2ClassificationTypeObj.transportationLoad.decimalString
    else
       edtTransportationLoad.Text := '';
    if ENPlanWork2ClassificationTypeObj.isPrintOnKmOrMH <> 0 then
       grpIsPrintOnKmOrMh.ItemIndex := ENPlanWork2ClassificationTypeObj.isPrintOnKmOrMH-1;


       // проверка какие виды работы в плане (лицензированные или нет)
          if ENPlanWork2ClassificationTypeObj.planRef.code > LOW_INT then
              begin
               // Проверить на вид работы (лицензированные или нет) если новая добавляемая не равна уже добавленым по виду работы то не давать выбирать работу .
               if isLicensed = LOW_INT then isLicensed := 0;

                TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

                plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
                SetNullIntProps(plan2ctFilter);
                SetNullXSProps(plan2ctFilter);

                plan2ctFilter.planRef := ENPlanWorkRef.Create;
                plan2ctFilter.planRef.code := ENPlanWork2ClassificationTypeObj.planRef.code;
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

               TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;

               isLicensed := classificationType.isnotlicensedactivity;

              if isLicensed = 0  then
                  DisableControls([edtRelocationKm,edtTransportationLoad ,edtMachineHours, grpIsPrintOnKmOrMh]);

              // если работа лецензированая то проверяем тип транспорта на техкарте
              if isLicensed = 1  then
                begin

                     TempTKTechCard :=  HTTPRIOTKTechCard{Source} as TKTechCardControllerSoapPort;
                     c := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

                     f := TKTechCardFilter.Create;
                     SetNullIntProps(f);
                     SetNullXSProps(f);
                     f.conditionSQL := ' TKTECHCARD.CLASSIFICATIONTYPECODE =  ' + IntToStr(ENPlanWork2ClassificationTypeObj.classificationTypeRef.code);
                     TKTechCardList := c.getScrollableFilteredList(f,0, -1);

                     for ii:= 0 to High(TKTechCardList.list) do
                      begin
                          if TKTechCardList.list[ii].code > 0 then
                          // выберем тип нормативного транспорта для скрытия или показывания полей маш.час. или КМ
                          TempTKTransport :=  HTTPRIOTKTransport as TKTransportControllerSoapPort;
                        //  if FilterObject = nil then
                        //  begin

                             ftranspfilter := TKTransportFilter.Create;
                             SetNullIntProps(ftranspfilter);
                             SetNullXSProps(ftranspfilter);
                             TKTransportFilter(ftranspfilter).conditionSQL := ' code  in (  Select tr.code from tkelement2techcard te2tk , tkelement te , tktransport tr ' +
                                                                                           ' Where te2tk.techkartcode = ' + IntToStr(TKTechCardList.list[ii].code) +
                                                                                           '  and te2tk.elementcode = te.code ' +
                                                                                           '  and te.elementtypecode = 240000002 ' +
                                                                                           '  and tr.elementcode = te.code )';


                        //  end;
                          TKTransportList := TempTKTransport.getScrollableFilteredList(TKTransportFilter(ftranspfilter),0,-1);
                        if High(TKTransportList.list) > -1 then
                         begin
                          for ti:= 0 to High(TKTransportList.list) do
                          begin
                                 tktransporttype := TKTransportList.list[0].transportTypeCode;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_CARTOWER then // автовишка
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_CRANE then // автокран
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_BKU then // БКУ
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_EXCAVATOR then // Екскаватор
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_TRUCK then // Самоскид
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad, grpIsPrintOnKmOrMh],False);
                                 DisableControls([edtRelocationKm ]);
                                   if ( ( Length(edtMachineHours.Text) > 0 ) and ( edtMachineHours.Text <> '0.000' )) then
                                    begin
                                      DisableControls([edtTransportationLoad]);
                                    end;
                                   if Length(edtTransportationLoad.Text) > 0  then
                                    begin
                                      DisableControls([edtMachineHours]);
                                    end;
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_BOARD then // Грузо-бортовий
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad, grpIsPrintOnKmOrMh],False);
                                 DisableControls([edtRelocationKm ]);
                                    if ( ( Length(edtMachineHours.Text) > 0 ) and ( edtMachineHours.Text <> '0.000' )) then
                                    begin
                                      DisableControls([edtTransportationLoad]);
                                    end;
                                   if Length(edtTransportationLoad.Text) > 0  then
                                    begin
                                      DisableControls([edtMachineHours]);
                                    end;
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_TRACTORTRAILER then // Сідельний тягач
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad, grpIsPrintOnKmOrMh],False);
                                 DisableControls([edtRelocationKm ]);
                                    if ( ( Length(edtMachineHours.Text) > 0 ) and ( edtMachineHours.Text <> '0.000' )) then
                                    begin
                                      DisableControls([edtTransportationLoad]);
                                    end;
                                   if Length(edtTransportationLoad.Text) > 0  then
                                    begin
                                      DisableControls([edtMachineHours]);
                                    end;
                                 End;
                          end;
                        end ;

                      end;

                end;




     if ENPlanWork2ClassificationTypeObj.isJobsByTime = 1 then
        isJobsByTime:= True
     else
        isJobsByTime:= False;
        
     if ENPlanWork2ClassificationTypeObj.isVisitClient = 1 then
        isVisitClient:= True
     else
        isVisitClient:= False;





  end;
end;

procedure TfrmENPlanWork2ClassificationTypeEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    condition : String;
    i : Integer;
    isCondition : boolean;
begin
	if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtTKClassificationTypeName
     ])  then
  begin
			Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else
  begin
    if ((distance = nil) and (guard = False)) then
    begin
      Application.MessageBox(PChar('Введіть відстань для розрахунку транспортних витрат (якщо транспорт не потрібний, введіть 0)!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;


    //TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

     if (ENPlanWork2ClassificationTypeObj.countGen = nil ) then
       ENPlanWork2ClassificationTypeObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENPlanWork2ClassificationTypeObj.countGen.decimalString := edtCountGen.Text
     else
       ENPlanWork2ClassificationTypeObj.countGen := nil;

		 ENPlanWork2ClassificationTypeObj.commentGen := edtCommentGen.Text;

     if (ENPlanWork2ClassificationTypeObj.machineHours = nil ) then
       ENPlanWork2ClassificationTypeObj.machineHours := TXSDecimal.Create;
     if edtMachineHours.Text <> '' then
       ENPlanWork2ClassificationTypeObj.machineHours.decimalString := edtMachineHours.Text
     else
       ENPlanWork2ClassificationTypeObj.machineHours.decimalString := '0';

    machinehours:= ENPlanWork2ClassificationTypeObj.machineHours;

    if (ENPlanWork2ClassificationTypeObj.relocationKm = nil ) then
       ENPlanWork2ClassificationTypeObj.relocationKm := TXSDecimal.Create;
     if edtRelocationKm.Text <> '' then
       ENPlanWork2ClassificationTypeObj.relocationKm.decimalString := edtRelocationKm.Text
     else
       ENPlanWork2ClassificationTypeObj.relocationKm := nil;

     if (ENPlanWork2ClassificationTypeObj.transportationLoad = nil ) then
       ENPlanWork2ClassificationTypeObj.transportationLoad := TXSDecimal.Create;
     if edtTransportationLoad.Text <> '' then
       ENPlanWork2ClassificationTypeObj.transportationLoad.decimalString := edtTransportationLoad.Text
     else
       ENPlanWork2ClassificationTypeObj.transportationLoad := nil;

     if grpIsPrintOnKmOrMh.ItemIndex <> -1 then
       ENPlanWork2ClassificationTypeObj.isPrintOnKmOrMH :=  grpIsPrintOnKmOrMh.ItemIndex+1
     else
       ENPlanWork2ClassificationTypeObj.isPrintOnKmOrMH := 0;

    //////////////////////////////////
    //  стоимость работ подрядчика  //
    //////////////////////////////////
    if (ENPlanWork2ClassificationTypeObj.costWorksContractor = nil ) then
       ENPlanWork2ClassificationTypeObj.costWorksContractor := TXSDecimal.Create;
     if edtCostWorksContractor.Text <> '' then
       ENPlanWork2ClassificationTypeObj.costWorksContractor.decimalString := edtCostWorksContractor.Text
     else
       ENPlanWork2ClassificationTypeObj.costWorksContractor := nil;

     if ( isJobsByTime  ) then
       ENPlanWork2ClassificationTypeObj.isJobsByTime := 1
     else
       ENPlanWork2ClassificationTypeObj.isJobsByTime := Low(Integer) ;

     if ( isVisitClient ) then
       ENPlanWork2ClassificationTypeObj.isVisitClient := 1
     else
       ENPlanWork2ClassificationTypeObj.isVisitClient := Low(Integer) ;


    if (isLicensed = 0) then  // если лицензированная работа
    begin
        if DialogState = dsInsert then
        begin
          if (priconnections and isTechCondition) then
          begin
            ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationForPriconnection(
              tcsCode, ENPlanWork2ClassificationTypeObj, distance, codeDepartmentForServicesObject, priconnections);
          end else
          if rent then
          ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForRent(
               ENPlanWork2ClassificationTypeObj, distance, codeDepartmentForServicesObject, customPlanDate)
          else
          if project then
          ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForProject(
               ENPlanWork2ClassificationTypeObj, distance, codeDepartmentForServicesObject, customPlanDate)
          else
          if guard then
          ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForGuard(
               ENPlanWork2ClassificationTypeObj, codeDepartmentForServicesObject, customPlanDate)
          else
          // ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationTypeObj, distance );
          ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject, priconnections, customPlanDate);
        end
				else
        if DialogState = dsEdit then
        begin
          if (priconnections and isTechCondition) then
          begin
            TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForConnection(
              ENPlanWork2ClassificationTypeObj, distance, priconnections);
          end else
          if rent then
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForRent(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject)
          else
          if project then
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject)
           else
          if guard then
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationTypeObj, codeDepartmentForServicesObject)
          else
				 // TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationTypeObj, distance);
				 TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject, priconnections);
        end;
    end;

    if (isLicensed <> 0) then  // если не лицензированная работа
		begin
//      distance.DecimalString := TXSDecimal.Create;
      relocationKm := TXSDecimal.Create;
      transportationLoad := TXSDecimal.Create;
      relocationKm  := ENPlanWork2ClassificationTypeObj.relocationKm;
      transportationLoad   := ENPlanWork2ClassificationTypeObj.transportationLoad;
        if relocationKm <> nil
        then
        distance :=  relocationKm;

        if transportationLoad <> nil
        then
        distance :=  transportationLoad;

        if ((transportationLoad = nil ) and  ( relocationKm = nil )) then
        begin
          if isLicensed <> 2 then
            distance.DecimalString := '0';
        end;

        if DialogState = dsInsert then
        begin

          if (cbIsShowOperation.Checked) then
          begin
            isCondition := false;
            condition := '';
            for i := 1 to sgTKTechCard.RowCount-1 do
            begin
               sgTKTechCard.GetCheckBoxState(1, i, isCondition);
               if (isCondition)
                 then AddListPos(condition, sgTKTechCard.Cells[0,i]);
            end;

            if (condition = '') then
            begin
                Application.MessageBox(PChar('Не вибрано жодної операції!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
                Action:=caNone;
            end
            else
              // ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanByListOperationsNotLicensed(ENPlanWork2ClassificationTypeObj, distance, machinehours, condition);
              ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanByListOperationsNotLicensed2(ENPlanWork2ClassificationTypeObj, distance, machinehours, condition , codeDepartmentForServicesObject, priconnections);
          end else
          begin
            if rent then
            ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForRent(
               ENPlanWork2ClassificationTypeObj, distance, codeDepartmentForServicesObject, customPlanDate)
            else
            if project then
            ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForProject(
               ENPlanWork2ClassificationTypeObj, distance, codeDepartmentForServicesObject, customPlanDate)
            else
            if guard then
            ENPlanWork2ClassificationTypeObj.code :=
            TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForGuard(
               ENPlanWork2ClassificationTypeObj, codeDepartmentForServicesObject, customPlanDate)
               else
            if isLicensed <> 2 then
              // ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(ENPlanWork2ClassificationTypeObj, distance , machinehours  )
                 ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(ENPlanWork2ClassificationTypeObj, distance , machinehours  , codeDepartmentForServicesObject, priconnections, customPlanDate)
            else
             // ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculation(ENPlanWork2ClassificationTypeObj, distance );
                ENPlanWork2ClassificationTypeObj.code := TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForCalculation2(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject, priconnections, customPlanDate);
          end;

        end
        else
        if DialogState = dsEdit then
        begin
          if project then
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForProject(ENPlanWork2ClassificationTypeObj, distance , codeDepartmentForServicesObject)
           else
           if guard then
           TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForGuard(ENPlanWork2ClassificationTypeObj, codeDepartmentForServicesObject)
          else
          TempENPlanWorkItem.savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(ENPlanWork2ClassificationTypeObj, distance , machinehours , codeDepartmentForServicesObject, priconnections);
        end;
    end;
   end;
end;

procedure TfrmENPlanWork2ClassificationTypeEdit.spbTKClassificationTypeClick(
  Sender: TObject);
var
   frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
   i , ii , ti , vi : Integer;


   TempENPlanWork2ClassificationType: ENPlanWork2ClassificationTypeControllerSoapPort;
   plan2ctFilter: ENPlanWork2ClassificationTypeFilter;
   ENPlanWork2ClassificationTypeList: ENPlanWork2ClassificationTypeShortList;

  f  : TKTechCardFilter;
  c: TKTechCardControllerSoapPort;
  TKTechCardList , tempList : TKTechCardShortList;
  TempTKTechCard: TKTechCardControllerSoapPort;

  TempTKTransport: TKTransportControllerSoapPort;
  itr : Integer;
  TKTransportList: TKTransportShortList;

  ftranspfilter : TKTransportFilter;

  TempTKClassification2ENDepartment: TKClassification2ENDepartmentControllerSoapPort;
  TempTKClassification2ENDepartmentFilter : TKClassification2ENDepartmentFilter;
  TempTKClassification2ENDepartmentList : TKClassification2ENDepartmentShortList;

  LastCountVb : Integer;

  TempTKVirtualBrigade: TKVirtualBrigadeControllerSoapPort;
  TempTKVirtualBrigadeFilter : TKVirtualBrigadeFilter;
  TKVirtualBrigadeList: TKVirtualBrigadeShortList;

  usersAllowedToAddCalculationFromTestSources : TStringList;

begin
     if codeDepartmentForServicesObject = -1 then
  begin
    Application.MessageBox(PChar('Оберіть спочатку підрозділ!!!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;



   sgTKTechCard.Clear;
   cbIsShowOperation.Checked := False;
   gbIsShowOperations.Visible := False;
   HideControls([edtCostWorksContractor, lblCostWorksContractor]);

   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmTKClassificationTypeShow.actNoFilter,
           frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
           frmTKClassificationTypeShow.actDelete]);

     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

     usersAllowedToAddCalculationFromTestSources := TStringList.Create;
     usersAllowedToAddCalculationFromTestSources.CommaText := DMReports.getSettingValueByKey(ENSettingsConsts.USERS_ALLOWED_TO_ADD_CALCULATION_FROM_TEST_SOURCES);

     // SUPP-18899 отныне тестируем калькуляции на рабочем сервере
     // источник с тестовыми калькуляциями показываем только юзерам из списка
     if (usersAllowedToAddCalculationFromTestSources.IndexOf(HTTPRIOENPlanWork2ClassificationType.HTTPWebNode.UserName) <> -1) then begin
       frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code in (' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_TEST_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS_20141201) + ')';
     end;

      with frmTKClassificationTypeShow do
        if ShowModal = mrOk then
        begin
            try
              // Проверить на вид работы (лецензир или нет ) если новая добавляемая не равна уже добавленым по виду работы то не давать выбирать работу .

              isLicensed := TKClassificationTypeShort(tvDep.Selected.Data).isnotlicensedactivity;
			  
              if ENPlanWork2ClassificationTypeObj.planRef.code > LOW_INT then
              begin

               if isLicensed = LOW_INT then isLicensed := 0;

                TempENPlanWork2ClassificationType := HTTPRIOENPlanWork2ClassificationType as ENPlanWork2ClassificationTypeControllerSoapPort;

                plan2ctFilter := ENPlanWork2ClassificationTypeFilter.Create;
                SetNullIntProps(plan2ctFilter);
                SetNullXSProps(plan2ctFilter);

                plan2ctFilter.planRef := ENPlanWorkRef.Create;
                plan2ctFilter.planRef.code := ENPlanWork2ClassificationTypeObj.planRef.code;
                plan2ctFilter.conditionSQL := 'classificationtyperfcd in ' +
                                              '(select ct.code from tkclassificationtype ct ' +
                                              '  where coalesce(ct.isnotlicensedactivity, 0) <> ' +
                                              IntToStr(isLicensed) + ') ';

                ENPlanWork2ClassificationTypeList := TempENPlanWork2ClassificationType.getScrollableFilteredList(plan2ctFilter, 0, -1);

                ///////////////////////////////////////////////////////////////////////////
                //  разрешаем для нелицензионных (с привлечением стороннего подрядчика)  //
                ///////////////////////////////////////////////////////////////////////////
                // 14.04.2013 +++ и для нового присоедининия!!!
                if (not priconnections) then
                if (High(ENPlanWork2ClassificationTypeList.list) > -1)
                      and (isLicensed <> ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR) then
                begin
                  Application.MessageBox(PChar('Не співпадають вид роботи, що додається, з вже доданими на плані!'), PChar('Увага!'), MB_ICONWARNING);
                  Exit;
                end;


              end;

              if isLicensed = LOW_INT then isLicensed := 0;

               if ENPlanWork2ClassificationTypeObj.classificationTypeRef = nil then ENPlanWork2ClassificationTypeObj.classificationTypeRef := TKClassificationTypeRef.Create();
               ENPlanWork2ClassificationTypeObj.classificationTypeRef.code := TKClassificationTypeShort(tvDep.Selected.Data).code;//StrToInt(GetReturnValue(sgTKClassificationType,0));
               edtTKClassificationTypeKod.Text := TKClassificationTypeShort(tvDep.Selected.Data).kod;//GetReturnValue(sgTKClassificationType,1);
               edtTKClassificationTypeName.Text := TKClassificationTypeShort(tvDep.Selected.Data).name;//GetReturnValue(sgTKClassificationType,1);

               ///////////////////////////////////
               //  для нелицензированных работ  //
               //  разрешаем выбор операций    ///
               ///////////////////////////////////
               if (isLicensed <> 0)
                  then gbIsShowOperations.Visible := True;
               ///////////////////////////////////

               ////////////////////////////////////////////////////////////
               //  Нелицензионная (с привлечением стороннего подрядчика) //
               ////////////////////////////////////////////////////////////
               if (isLicensed = ISNOTLICENSEDACTIVITY_COSTWORKSCONTRACTOR) then
               begin
                  HideControls([edtCostWorksContractor, lblCostWorksContractor], false);
                  DenyBlankValues([edtCostWorksContractor]);
                  edtCostWorksContractor.Text := TKClassificationTypeShort(tvDep.Selected.Data).costWorksContractor.DecimalString;
               end;
               ////////////////////////////////////////////////////////////

               if (isLicensed <> 1) then
                  DisableControls([edtRelocationKm,edtTransportationLoad ,edtMachineHours, grpIsPrintOnKmOrMh]);

               // проверка на то что  класификация в ресе резервируется по времени
                  begin
                TempTKClassification2ENDepartmentFilter := TKClassification2ENDepartmentFilter.Create;
                SetNullIntProps(TempTKClassification2ENDepartmentFilter);
                SetNullXSProps(TempTKClassification2ENDepartmentFilter);
                TempTKClassification2ENDepartmentFilter.classificationTypeRef := TKClassificationType.Create;
                TempTKClassification2ENDepartmentFilter.classificationTypeRef.code :=  TKClassificationTypeShort(tvDep.Selected.Data).code;
                TempTKClassification2ENDepartmentFilter.endepartmentRef := ENDepartment.Create;
                TempTKClassification2ENDepartmentFilter.endepartmentRef.code := codeDepartmentForServicesObject;
                TempTKClassification2ENDepartmentFilter.isJobsByTime := 1;
                TempTKClassification2ENDepartment  := HTTPRIOTKClassification2ENDepartment  as TKClassification2ENDepartmentControllerSoapPort;
                TempTKClassification2ENDepartmentList :=  TempTKClassification2ENDepartment.getScrollableFilteredList(TempTKClassification2ENDepartmentFilter,0,-1);
                 // если лист не пустой значит добавляемая работа для данного Подразделения является временной резервируемой
                 if High(TempTKClassification2ENDepartmentList.list) > -1 then
                  begin
                    isJobsByTime := True;
                     if TempTKClassification2ENDepartmentList.list[0].isVisitClient = 1 then
                        isVisitClient := True;
                  end;
               end;
            except
               on EConvertError do Exit;
            end;

            // вытягиваем тип транспорта для нелицензированных работ
                if isLicensed = 1  then
                begin

                     TempTKTechCard :=  HTTPRIOTKTechCard{Source} as TKTechCardControllerSoapPort;
                     c := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

                     f := TKTechCardFilter.Create;
                     SetNullIntProps(f);
                     SetNullXSProps(f);
                     f.conditionSQL := ' TKTECHCARD.CLASSIFICATIONTYPECODE =  ' + IntToStr(ENPlanWork2ClassificationTypeObj.classificationTypeRef.code);
                     TKTechCardList := c.getScrollableFilteredList(f,0, -1);

                     for ii:= 0 to High(TKTechCardList.list) do
                      begin
                          if TKTechCardList.list[ii].code > 0 then
                          // выберем тип нормативного транспорта для скрытия или показывания полей маш.час. или КМ
                          TempTKTransport :=  HTTPRIOTKTransport as TKTransportControllerSoapPort;
                        //  if FilterObject = nil then
                        //  begin

                             ftranspfilter := TKTransportFilter.Create;
                             SetNullIntProps(ftranspfilter);
                             SetNullXSProps(ftranspfilter);
                             TKTransportFilter(ftranspfilter).conditionSQL := ' code  in (  Select tr.code from tkelement2techcard te2tk , tkelement te , tktransport tr ' +
                                                                                           ' Where te2tk.techkartcode = ' + IntToStr(TKTechCardList.list[ii].code) +
                                                                                           '  and te2tk.elementcode = te.code ' +
                                                                                           '  and te.elementtypecode = 240000002 ' +
                                                                                           '  and tr.elementcode = te.code )';


                        //  end;
                          TKTransportList := TempTKTransport.getScrollableFilteredList(TKTransportFilter(ftranspfilter),0,-1);
                        if High(TKTransportList.list) > -1 then
                         begin
                          for ti:= 0 to High(TKTransportList.list) do
                          begin
                                 tktransporttype := TKTransportList.list[0].transportTypeCode;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_CARTOWER then // автовишка
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_CRANE then // автокран
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_BKU then // БКУ
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_EXCAVATOR then // Екскаватор
                                 Begin
                                 DisableControls([edtMachineHours, edtRelocationKm],False);
                                 DisableControls([edtTransportationLoad, grpIsPrintOnKmOrMh]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_TRUCK then // Самоскид
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad, grpIsPrintOnKmOrMh ],False);
                                 DisableControls([edtRelocationKm ]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_BOARD then // Грузо-бортовий
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad,grpIsPrintOnKmOrMh ],False);
                                 DisableControls([edtRelocationKm ]);
                                 End;
                              if TKTransportList.list[0].transportTypeCode = AVTOTYPE_TRACTORTRAILER then // Сідельний тягач
                                 Begin
                                 DisableControls([edtMachineHours, edtTransportationLoad,grpIsPrintOnKmOrMh ],False);
                                 DisableControls([edtRelocationKm ]);
                                 End;
                          end;
                        end
                        else
                        begin
                         Application.MessageBox(PChar('На калькуляції немає транспорту !'), PChar('Увага!'), MB_ICONWARNING);
                         edtTKClassificationTypeName.Text := '';
                         edtTKClassificationTypeKod.Text := '';
                         DisableControls([edtRelocationKm,edtTransportationLoad ,edtMachineHours ]);

                         Exit;
                        end;

                      end;

                end;
        end;
   finally
      frmTKClassificationTypeShow.Free;
   end;
end;

procedure TfrmENPlanWork2ClassificationTypeEdit.edtMachineHoursChange(
  Sender: TObject);
begin
   // для типов транспорта Грузо бортовой, Самосвал , Седельный тягач проверяем если введено
   // значение по Часу роботи на объекте то лочим поле Перевезення вантажу и наоборот .

   if ( (tktransporttype =  AVTOTYPE_TRUCK )
     or (tktransporttype =   AVTOTYPE_BOARD)
     or (tktransporttype = AVTOTYPE_TRACTORTRAILER) ) then
    begin
     if (( Length(edtMachineHours.Text) > 0 ) and (edtMachineHours.Text <> '0')) then
        begin
         edtTransportationLoad.Text:= '';
         DisableControls([edtTransportationLoad]);
        end
        else
        DisableControls([edtTransportationLoad],false);

    end;


end;

procedure TfrmENPlanWork2ClassificationTypeEdit.edtTransportationLoadChange(
  Sender: TObject);
begin
  // для типов транспорта Грузо бортовой, Самосвал , Седельный тягач проверяем если введено
   // значение по Часу роботи на объекте то лочим поле Перевезення вантажу и наоборот .

   if ( (tktransporttype =  AVTOTYPE_TRUCK )
     or (tktransporttype =   AVTOTYPE_BOARD)
     or (tktransporttype = AVTOTYPE_TRACTORTRAILER) ) then
    begin

     if ((Length(edtTransportationLoad.Text) > 0) and (edtTransportationLoad.Text <> '0')) then
        begin
         edtMachineHours.Text:= '';
         DisableControls([edtMachineHours]);
        end
        else
        DisableControls([edtMachineHours],false);
    end;

end;

procedure TfrmENPlanWork2ClassificationTypeEdit.btnENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               codeDepartmentForServicesObject := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartmentForServices.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWork2ClassificationTypeEdit.cbIsShowOperationClick(
  Sender: TObject);
var
  TempTKTechCard : TKTechCardControllerSoapPort;
  i : Integer;
  TKTechCardList : TKTechCardShortList;
  f : TKTechCardFilter;
begin
  inherited;

    if cbIsShowOperation.Checked then
    begin
      sgTKTechCard.Visible := True;
      btnOk.Top := 500;
      btnCancel.Top := 500;
      Top := 130;
       Height := 565;

      sgTKTechCard.Clear;
      SetGridHeaders(TKTechCardHeaders, sgTKTechCard.ColumnHeaders);
      ColCount:=100;
      TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

      f := TKTechCardFilter.Create;
      f.conditionSQL := ' TKTECHCARD.CLASSIFICATIONTYPECODE =  '
         + IntToStr(ENPlanWork2ClassificationTypeObj.classificationTypeRef.code);
      SetNullIntProps(f);
      SetNullXSProps(f);

      TKTechCardList := TempTKTechCard.getScrollableFilteredList(f, 0, -1);
      LastCount := High(TKTechCardList.list);

      if LastCount > -1 then
         sgTKTechCard.RowCount := LastCount+2
      else
         sgTKTechCard.RowCount := 2;

       with sgTKTechCard do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if TKTechCardList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKTechCardList.list[i].code)
            else
            Cells[0,i+1] := '';

            AddCheckBox(1, i+1, true, false);
            Cells[1,i+1] := TKTechCardList.list[i].techKartNumber;

            Cells[2,i+1] := TKTechCardList.list[i].name;

            if TKTechCardList.list[i].normOfTime = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := TKTechCardList.list[i].normOfTime.DecimalString;

            Cells[4,i+1] := TKTechCardList.list[i].safety;

            if TKTechCardList.list[i].dateCreation = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := XSDate2String(TKTechCardList.list[i].dateCreation);

            if TKTechCardList.list[i].dateFrom = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := XSDate2String(TKTechCardList.list[i].dateFrom);

            if TKTechCardList.list[i].dateTo = nil then
              Cells[7,i+1] := ''
            else
              Cells[7,i+1] := XSDate2String(TKTechCardList.list[i].dateTo);

            Cells[8,i+1] := TKTechCardList.list[i].workconditions;

            LastRow := i+1;
            sgTKTechCard.RowCount := LastRow+1;
          end;
       ColCount := ColCount+1;
       sgTKTechCard.Row := 1;


    end else
    begin
      sgTKTechCard.Clear;
      sgTKTechCard.Visible := False;
      btnOk.Top := 190;
      btnCancel.Top := 190;
      Height := 255;
    end;

end;
procedure TfrmENPlanWork2ClassificationTypeEdit.FormCreate(
  Sender: TObject);
begin
  priconnections := False;
  isTechCondition := False;
  guard := False;
end;

end.

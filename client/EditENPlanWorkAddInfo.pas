unit EditENPlanWorkAddInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , DialogFormUnit, ChildFormUnit
  ,ENPlanWorkController, Buttons, StdCtrls, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient
  ,XSBuiltIns
  ,ENMOL2PlanWorkController
  ;

type
  TfrmENPlanWorkAddInfoEdit = class(TDialogForm)
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    HTTPRIOENMOL2PlanWork: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      planObj: ENPlanWork;
      ENMOL2PlanWorkObj: ENMOL2PlanWork;
      isChangeExecutorDepartment : Boolean;
  end;

var
  frmENPlanWorkAddInfoEdit: TfrmENPlanWorkAddInfoEdit;



implementation

uses ENConsts, ShowFINExecutorTree, FINExecutorController,
  FINMolController, ShowFINMol, ENDepartment2EPRenController,
   ENDepartmentController, ShowENDepartment, DMReportsUnit;


{$R *.dfm}

procedure TfrmENPlanWorkAddInfoEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   TempENPlanWork: ENPlanWorkControllerSoapPort;
   TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin

  if ((ModalResult = mrOk) and (DialogState = dsEdit)) then
  if (not NoBlankValues([
      edtDateStart
      , edtDateFinal
      
     ]) and (isChangeExecutorDepartment = false )
     or  not NoBlankValues([

        edtFINExecutorName
      , edtDepartment
     ]) and (isChangeExecutorDepartment = True ) )   then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;


     if edtdateStart.checked then
     begin
       if planObj.dateStart = nil then
          planObj.dateStart := TXSDate.Create;
       planObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       planObj.dateStart := nil;

     if edtdateFinal.checked then
     begin
       if planObj.dateFinal = nil then
          planObj.dateFinal := TXSDate.Create;
       planObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       planObj.dateFinal := nil;

       if isChangeExecutorDepartment = True then
       TempENPlanWork.saveAddInfoExecutorDepartment(planObj) // обновляем исполнителя и подразделения исполнителя
       else
       begin
       TempENPlanWork.saveAddInfo(planObj); // обновляем даты выполнения и МОЛ

            if ENMOL2PlanWorkObj <> nil then
            begin
               if ENMOL2PlanWorkObj.molName <> '' then
               begin
                     TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;

                     if ENMOL2PlanWorkObj.code > LOW_INT then
                        TempENMOL2PlanWork.save(ENMOL2PlanWorkObj)
                     else
                        TempENMOL2PlanWork.add(ENMOL2PlanWorkObj);
               end;
            end;
       end;

  end;
end;

procedure TfrmENPlanWorkAddInfoEdit.FormShow(Sender: TObject);
var
 TempENPlanWork: ENPlanWorkControllerSoapPort;

  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  TempENDepartment: ENDepartmentControllerSoapPort;
  departmentObj: ENDepartment;
begin

        DisableControls([edtYearGen, edtMonthGen, edtFINExecutorName, edtMolName , edtDepartment]);
        DenyBlankValues([edtFINExecutorName , edtDepartment]);

        edtMonthGen.Text := IntToStr(planObj.monthGen);
        edtYearGen.Text := IntToStr(planObj.yearGen);

        if not isChangeExecutorDepartment then
        begin
        DisableControls([lblExecuter , edtFINExecutorName , spbFINExecutor ]);
        HideControls([lblExecuter , edtFINExecutorName , spbFINExecutor ]);
        end;

        // 27.02.12 Нафига они вообще здесь нужны - все равно не используются, еще и сетятся криво
        HideControls([lblYearGen, lblMonthGen, edtYearGen, edtMonthGen]);

        if (( planObj.kind.code = ENPLANWORKKIND_CURRENT) and (isChangeExecutorDepartment = false) ) then
        begin
          gbPlanMOL.Visible := true;

               TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
               ENMOL2PlanWorkFilterObj := ENMOL2PlanWorkFilter.Create;
               SetNullXSProps(ENMOL2PlanWorkFilterObj);
               SetNullIntProps(ENMOL2PlanWorkFilterObj);

               ENMOL2PlanWorkFilterObj.planRef := ENPlanWorkRef.Create;
               ENMOL2PlanWorkFilterObj.planRef.code := planObj.code;
               ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilterObj, 0, -1);
               if ENMOL2PlanWorkList.totalCount > 0 then
                  //ENMOL2PlanWorkObj := TempENMOL2PlanWork.getObject(ENMOL2PlanWorkList.list[0].code)
                  edtMolName.Text :=  ENMOL2PlanWorkList.list[0].molName
               else
                  edtMolName.Text := '';

        end
        else
          gbPlanMOL.Visible := false;

          if not isChangeExecutorDepartment then
          HideControls([lblDepartment , edtDepartment , spbDepartment]);

        if planObj.finExecutor <> nil then
          if planObj.finExecutor.code > LOW_INT then
          begin
             edtFINExecutorName.Text := planObj.finExecutor.name;
          end;

      if planObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(planObj.dateStart.Year,planObj.dateStart.Month,planObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      
      if planObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(planObj.dateFinal.Year,planObj.dateFinal.Month,planObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

  if planObj.departmentRef <> nil then
  begin
    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    departmentObj := TempENDepartment.getObject(planObj.departmentRef.code);
    if departmentObj <> nil then
      edtDepartment.Text := departmentObj.shortName;
  end;

  ///// 27.02.12 NET-1355 Запрещаем изменять дату окончания выполнения работ руками - будем рассчитывать сами
  DisableControls([edtDateFinal]);
end;

procedure TfrmENPlanWorkAddInfoEdit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;

begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              planObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
              edtFINExecutorName.Text := planObj.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENPlanWorkAddInfoEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
begin  

 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

//   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
   if planObj.departmentRef <> nil then
     if planObj.departmentRef.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := planObj.departmentRef.code;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
               ENMOL2PlanWorkFilterObj := ENMOL2PlanWorkFilter.Create;
               SetNullXSProps(ENMOL2PlanWorkFilterObj);
               SetNullIntProps(ENMOL2PlanWorkFilterObj);

               ENMOL2PlanWorkFilterObj.planRef := ENPlanWorkRef.Create;
               ENMOL2PlanWorkFilterObj.planRef.code := planObj.code;
               ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilterObj, 0, -1);
               if ENMOL2PlanWorkList.totalCount > 0 then
                  ENMOL2PlanWorkObj := TempENMOL2PlanWork.getObject(ENMOL2PlanWorkList.list[0].code)
               else
               begin
                 ENMOL2PlanWorkObj := ENMOL2PlanWork.Create();
                 ENMOL2PlanWorkObj.code := LOW_INT;
                 ENMOL2PlanWorkObj.planRef := ENPlanWorkRef.Create();
                 ENMOL2PlanWorkObj.planRef.code := planObj.code;
               end;

               ENMOL2PlanWorkObj.molName := GetReturnValue(sgFINMol,1);
               ENMOL2PlanWorkObj.molCode := GetReturnValue(sgFINMol,0);

               edtMolName.Text := ENMOL2PlanWorkObj.molName;  //GetReturnValue(sgFINMol,0);
               //edtFINMolName.Text := //GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1)


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


   
end;

procedure TfrmENPlanWorkAddInfoEdit.spbPlanMOLClearClick(Sender: TObject);

var
  //ENMOL2PlanWorkObj: ENMOL2PlanWork;
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;
  i : integer;
begin
  inherited;
if Application.MessageBox(PChar('Видалити МОЛа ?'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
begin

if (edtMolName.Text = '') then
begin

if Application.MessageBox(PChar('Удалять нечего :( ... !! Все равно ЧТО-ТО удалить ???????'),
                                       PChar('Увага!'),
                                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
begin
ShowMessage('Бывает ;) ...');
exit;
end;


end;

               TempENMOL2PlanWork :=  HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;
               ENMOL2PlanWorkFilterObj := ENMOL2PlanWorkFilter.Create;
               SetNullXSProps(ENMOL2PlanWorkFilterObj);
               SetNullIntProps(ENMOL2PlanWorkFilterObj);

               ENMOL2PlanWorkFilterObj.planRef := ENPlanWorkRef.Create;
               ENMOL2PlanWorkFilterObj.planRef.code := planObj.code;
               ENMOL2PlanWorkList := TempENMOL2PlanWork.getScrollableFilteredList(ENMOL2PlanWorkFilterObj, 0, -1);
               for i:=0 to ENMOL2PlanWorkList.totalCount-1 do
               begin
                   TempENMOL2PlanWork.remove(ENMOL2PlanWorkList.list[i].code);
               end;
               edtMolName.Text := '';
               if  ENMOL2PlanWorkObj <> nil then
               begin
                 ENMOL2PlanWorkObj.molName := '';
                 ENMOL2PlanWorkObj.code := LOW_INT;
               end;
end;

end;

procedure TfrmENPlanWorkAddInfoEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;
 {  if planObj.elementRef <> nil then
      if planObj.elementRef.code > LOW_INT then
         if planObj.renRef <> nil then

            if planObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(planObj.renRef.code) +')';
               f.code := Low(integer);
            end;   }





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin
            try
               if planObj.departmentRef = nil then planObj.departmentRef := ENDepartmentRef.Create();
               planObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPlanWorkAddInfoEdit.FormCreate(Sender: TObject);
begin
   inherited;
    isChangeExecutorDepartment:= False;
end;

end.

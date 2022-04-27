unit EditFINWorkerAssignToAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, XSBuiltIns, FINWorkerController;

type
  TfrmFINWorkerAssignToAllEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtENWorkerWorkerFactName: TEdit;
    lblENWorkerWorkerFactName: TLabel;
    spbENWorkerWorkerFact: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planCode : Integer;
    workOrderBytCode : Integer;
    isDriver : Boolean;
    FINWorkerObj : FINWorker;
  end;

var
  frmFINWorkerAssignToAllEdit: TfrmFINWorkerAssignToAllEdit;

implementation

uses DMReportsUnit, ENConsts, ChildFormUnit,
     ShowFINWorker, ENPlanWorkController, FINWorkerKindController ,
  ENWorkOrderBytController;

{$R *.dfm}

procedure TfrmFINWorkerAssignToAllEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
  begin
    if not NoBlankValues([edtENWorkerWorkerFactName]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
  end;
end;

procedure TfrmFINWorkerAssignToAllEdit.spbENWorkerWorkerFactClick(
  Sender: TObject);
  var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   plan : ENPlanWork;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
   departmentNameString: string;
   departmentCode : string;
   workOrderByt: ENWorkOrderByt;
   isODS: boolean;
begin

  inherited;

      if (planCode = LOW_INT) and (workOrderBytCode = LOW_INT) then
      begin
        Application.MessageBox(PChar('Робітник додається з плану!!!'), PChar('Увага !'),MB_ICONWARNING);
        exit;
      end;

      if planCode <> LOW_INT then
      begin
        plan := DMReports.getPlanByCode(planCode);
        eType := DMReports.getElementByCode(plan.elementRef.code).typeRef.code;
      end
      else if workOrderBytCode <> LOW_INT then
      begin
        workOrderByt := DMReports.getWorkOrderBytByCode(workOrderBytCode);
      end
      else begin
        Application.MessageBox(PChar('Не заданий ані код плану, ані код змінного завдання!'), PChar('Увага !'), MB_ICONWARNING);
        Exit;
      end;


      f := FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

    // это для ЗП ... уехало в Штатное
   //f.conditionSQL := 'kdv.date_uvol is null '; // только работающие ...
   //f.conditionSQL := f.conditionSQL + ' and p.podrcod = '+chr(39) + '0' + DMReports.getFinRenByDepartmentCode(plan.departmentRef.code) + chr(39) ;

   if planCode <> LOW_INT then
   begin
     f.departmentCode := IntToStr(plan.departmentRef.code);

     if plan.finExecutor <> nil then
     begin
       if plan.finExecutor.code > LOW_INT then
       begin
         // MDAX-441
         if DMReports.UsesMDAXData then
           f.departmentCode := plan.finExecutor.axOrgId
         else
           f.departmentCode := intToStr( plan.finExecutor.finCode );
       end
       else
         Application.MessageBox(PChar('Не выбрана бригада! Выберите бригаду на плане или воспользуйтесь фильтром!'), PChar('Внимание!'), MB_ICONINFORMATION);
     end;
   end
   else begin
     if workOrderBytCode <> LOW_INT then
       if workOrderByt <> nil then
       begin
         if workOrderByt.departmentRef <> nil then
           f.departmentCode := IntToStr(workOrderByt.departmentRef.code);

         if workOrderByt.finWorker <> nil then
           f.departmentCode := workOrderByt.finWorker.departmentCode;
       end;
   end;

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     frmFINWorkerShow.dateGet := nil;

     if planCode <> LOW_INT then
     begin
       frmFINWorkerShow.dateGet := TXSDate.Create;
       frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year, plan.dateStart.Month, plan.dateStart.Day) ));
     end
     else begin
       if workOrderBytCode <> LOW_INT then
         if workOrderByt <> nil then
           if workOrderByt.dateGen <> nil then
           begin
             frmFINWorkerShow.dateGet := TXSDate.Create;
             frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(workOrderByt.dateGen.Year, workOrderByt.dateGen.Month, workOrderByt.dateGen.Day) ));
           end;
     end;

     if self.isDriver = false then
        frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH
     else
        frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_DRIVER;

     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            /// 15.02.11
            NVZType := GetReturnValue(sgFINWorker,8);
            IsNVZ := false;

            // NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
            departmentNameString := GetReturnValue(sgFINWorker,5);
            departmentCode := GetReturnValue(sgFINWorker,6);

            if (DMReports.UsesMDAXData) then isODS := (departmentCode = '001')
             else isODS := (departmentCode = '93');


            if planCode <> LOW_INT then
            begin
              if (Pos('Оперативно', departmentNameString) > 0) then
                 begin
                    if (((plan.budgetRef.code <> ENConsts.ENBUDGET_ODG)
                    and (plan.budgetRef.code <> ENConsts.ENBUDGET_SPS))
                    and (not isODS) ) then
                       begin
                           Application.MessageBox(PChar('Цей робітник відноситься до ОДГ(ОВБ)! План повинен бути для бюджетотримача ОДГ або СПС'),
                                  PChar('Увага !'), MB_ICONERROR+MB_OKCANCEL);
                           exit;
                       end;
                 end;

              if (eType <> EN_BYT) and (eType <> EN_PROM) then
              begin
                if NVZType = '1' then IsNVZ := true  // НВЗ
              end
              else
                if NVZType = '2' then IsNVZ := true; // НВЗ_Е

              if eType = EN_SERVICES_OBJECT then
                if (NVZType = '1') or (NVZType = '2') then
                  IsNVZ := true;

              if ((not IsNVZ  ) and (GetReturnValue(sgFINWorker,8) = '') )  then
              ///
              begin
                if Application.MessageBox(PChar('У цього працівника не встановлений признак участі в НВЗ !!! '+ #13#10+'Він не буде відображений у Додатках 3...'+ #13#10+'Тел. 12-62 ...'),
                                  PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
                exit;
              end;
            end;



            try
              FINWorkerObj := FINWorker.Create;
              FINWorkerObj.code := low(Integer);

              FINWorkerObj.name := GetReturnValue(sgFINWorker,1);
              FINWorkerObj.tabNumber := GetReturnValue(sgFINWorker,2);
              FINWorkerObj.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                FINWorkerObj.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                FINWorkerObj.positionCode := LOW_INT;

              FINWorkerObj.departmentName := GetReturnValue(sgFINWorker,5);
              FINWorkerObj.departmentCode := (GetReturnValue(sgFINWorker,6));
              if FINWorkerObj.priceGen = nil then FINWorkerObj.priceGen := TXSDecimal.Create;
              FINWorkerObj.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              FINWorkerObj.kindRef := FINWorkerKindRef.Create;
              FINWorkerObj.categor := LOW_INT;

              if isDriver = false then
              begin
                  if GetReturnValue(sgFINWorker,8) = '' then
                  begin
                      FINWorkerObj.kindRef.code := FINWORKER_KIND_OTHER;
                  end
                  else
                  begin
                      FINWorkerObj.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
                  end;
              end;

              if isDriver = true then
                  if GetReturnValue(sgFINWorker,8) = '' then
                    FINWorkerObj.categor := LOW_INT
                  else
                    FINWorkerObj.categor := StrToInt(GetReturnValue(sgFINWorker,8));


              if (GetReturnValue(sgFINWorker,9) <> '') then
                FINWorkerObj.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                FINWorkerObj.finCode := LOW_INT;

              if (GetReturnValue(sgFINWorker,12) <> '') then
                FINWorkerObj.categorId := StrToInt(GetReturnValue(sgFINWorker,12))
              else
                FINWorkerObj.categorId := LOW_INT;

              FINWorkerObj.categorName := GetReturnValue(sgFINWorker,13);
              FINWorkerObj.workTimeId := GetReturnValue(sgFINWorker,14);

              FINWorkerObj.positionId := GetReturnValue(sgFINWorker,15);

              self.edtENWorkerWorkerFactName.Text := FINWorkerObj.name;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmFINWorkerAssignToAllEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isDriver := false;
  planCode := LOW_INT;
  workOrderBytCode := LOW_INT;
end;

procedure TfrmFINWorkerAssignToAllEdit.FormShow(Sender: TObject);
begin
  inherited;

  if isDriver = true then
    self.Caption := 'Привязати водія до обраного транспорту';

  DisableControls([edtENWorkerWorkerFactName]);
  DenyBlankValues([edtENWorkerWorkerFactName]);
end;

end.

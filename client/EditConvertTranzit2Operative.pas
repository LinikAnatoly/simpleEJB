unit EditConvertTranzit2Operative;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls, InvokeRegistry,
  Rio, SOAPHTTPClient, SOAPHTTPTrans;

type
  TfrmConvertTranzit2OperativeEdit = class(TDialogForm)
    btnStart: TButton;
    dtpDateStart: TDateTimePicker;
    dtpDateFinish: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    edtEstimateItemCode: TEdit;
    Label3: TLabel;
    HTTPRIORQFKOrder: THTTPRIO;
    Button1: TButton;
    dtpDateGen: TDateTimePicker;
    Label4: TLabel;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrderItem: THTTPRIO;
    log2: TMemo;
    log: TMemo;
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    //budgetCode: Integer;
    //departmentCode: Integer;

  public
    { Public declarations }
    estimateItemCode: Integer;
    departmentCode: Integer;
    departmentName: String;
    budgetCode: Integer;
    budgetName: String;
  end;

var
  frmConvertTranzit2OperativeEdit: TfrmConvertTranzit2OperativeEdit;

implementation

uses ShowENDepartment, ENConsts, ENDepartmentController, XSBuiltIns,
  RQFKOrderController, ENDepartmentTypeController, ChildFormUnit,
  FINMaterialsController, RQFKOrderItemController;

{$R *.dfm}

procedure TfrmConvertTranzit2OperativeEdit.spbENBudgetClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   cfoCode : Integer;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName; //budgetName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmConvertTranzit2OperativeEdit.FormCreate(Sender: TObject);
begin
  budgetCode := LOW_INT;
  departmentCode := LOW_INT;
  estimateItemCode := LOW_INT;
end;

procedure TfrmConvertTranzit2OperativeEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := LOW_INT;
  edtENBudgetName.Text := '';
end;

procedure TfrmConvertTranzit2OperativeEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENBudgetName, edtDepartment, edtEstimateItemCode, spbDepartment, spbDepartmentClear]);

  if estimateItemCode > LOW_INT then
    edtEstimateItemCode.Text := IntToStr(estimateItemCode);

  edtDepartment.Text := departmentName;

  dtpDateGen.Date := Date;
  dtpDateGen.Checked := true;

  dtpDateStart.Checked := false;
  dtpDateFinish.Checked := false;  
end;

procedure TfrmConvertTranzit2OperativeEdit.spbDepartmentClick(
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
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               //ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               //departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmConvertTranzit2OperativeEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  if Application.MessageBox(PChar('Після очистки Підрозділу будуть вибиратися плани усіх Підрозділів ОЕ !!!  Продовжити ??'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
  begin
      Exit;
  end;

  departmentCode := LOW_INT;
  //departmentName := '';
  edtDepartment.Text:= '';
end;

procedure TfrmConvertTranzit2OperativeEdit.btnStartClick(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
    //estimateItemCode: Integer;
    dateStart, dateFinish, dateGen: TXSDate;
    TempFINMaterials: FINMaterialsControllerSoapPort;
    FINMaterialsList: FINMaterialsShortList;
    finMaterialsObj: FINMaterials;
    i, fkOrderCode, finMaterialsCount: Integer;
    finMaterialsCodes: ArrayOfInteger;
    itemFilter :  RQFKOrderItemFilter;
    itemList : RQFKOrderItemShortList;
    str, molCode: String;
    //fkOrderObj: RQFKOrder;
begin
  if Application.MessageBox(PChar('Розпочати формування внутрішніх переміщень?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  {
  try
    estimateItemCode := StrToInt(edtEstimateItemCode.Text);
  except
    on EConvertError do Exit;
  end;
  }

  if estimateItemCode <= 0 then
  begin
    Application.MessageBox(PChar('Не обраний план, під який передаються матеріали!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;

 { if departmentCode <= 0 then
  begin
    Application.MessageBox(PChar('Не вказано Підрозділ!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;
  }
  if not dtpDateStart.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату початку!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not dtpDateFinish.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату завершення!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not dtpDateGen.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату ордерів!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;

  dateStart := TXSDate.Create;
  dateStart.XSToNative(GetXSDate(dtpDateStart.DateTime));

  dateFinish := TXSDate.Create;
  dateFinish.XSToNative(GetXSDate(dtpDateFinish.DateTime));

  dateGen := TXSDate.Create;
  dateGen.XSToNative(GetXSDate(dtpDateGen.DateTime));

  //TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  //TempRQFKOrder.convertTranzit2Operative(estimateItemCode, dateStart, dateFinish, budgetCode, departmentCode,
  //   ' and moloutcode not like (''18%'') and moloutcode not like (''%00'')');

  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  FINMaterialsList := TempFINMaterials.getListForTranzit2Operative(dateStart, dateFinish, budgetCode, departmentCode, '');

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  str := '';

  molCode := '-1';
  fkOrderCode := LOW_INT;

  //SetLength(finMaterialsCodes, 0);

  for i := 0 to High(FINMaterialsList.list) do
  begin
    try
      //str := str + #13#10 + FINMaterialsList.list[i].mat_name + ' #### molcode: ' + FINMaterialsList.list[i].div_code;

      // Если изменился МОЛ в списке материалов (список отсортирован по МОЛам), создаем новый ордер
      if FINMaterialsList.list[i].div_code <> molCode then
      begin
        if (molCode <> '-1') and (FINMaterialsList.list[i].div_code <> molCode) then
        begin
          /// Тут проводим ордер с кодом fkOrderCode
          // .....

           itemFilter := RQFKOrderItemFilter.Create;
           SetNullIntProps(itemFilter);
           SetNullXSProps(itemFilter);
           itemFilter.fkOrderRef := RQFKOrderRef.Create;
           itemFilter.fkOrderRef.code := fkOrderCode;

           TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
           itemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter, 0 , -1);

           if (itemList.totalCount > 0) then
           begin
                // скласти
                TempRQFKOrder.createdPrihod(fkOrderCode);
                // провести
                TempRQFKOrder.moveRashodInFK(fkOrderCode);
           end else
           begin
                TempRQFKOrder.remove(fkOrderCode);
           end;


          SetLength(finMaterialsCodes, 0);
        end;

        molCode := FINMaterialsList.list[i].div_code;
        //molCode: String; molName: String; dateGen: TXSDate
        fkOrderCode := TempRQFKOrder.createRQFKOrderForTranzit2Operative(FINMaterialsList.list[i].div_code,
                                                                         FINMaterialsList.list[i].div_name,
                                                                         dateGen);
        //fkOrderObj := TempRQFKOrder.getObject(fkOrderCode);
      end;

      // Накидываем строки в ордер
      if fkOrderCode > LOW_INT then
      begin
        finMaterialsObj := TempFINMaterials.getObject(FINMaterialsList.list[i].code);
        finMaterialsObj.code := LOW_INT;
        finMaterialsObj.finDocItemCode := -1;
        finMaterialsObj.estimateItemRef.code := estimateItemCode;
        finMaterialsObj.dateEdit := nil;
        finMaterialsObj.molDataRef := nil;
        finMaterialsObj.parentRef := nil;

        finMaterialsObj.div_code := molCode;
        finMaterialsObj.div_name := FINMaterialsList.list[i].div_name;

        // код старого финматериалса   
        finMaterialsObj.oldCode := FINMaterialsList.list[i].code;
        

        //TempRQFKOrderItem.addOE2REM(finMaterialsObj, fkOrderCode);
        TempRQFKOrderItem.addForTranzit2Operative(finMaterialsObj, fkOrderCode);

        finMaterialsCount := High(finMaterialsCodes) + 1;
        SetLength(finMaterialsCodes, finMaterialsCount + 1);
        finMaterialsCodes[finMaterialsCount] := FINMaterialsList.list[i].code;
      end;

    except

      on E: ESOAPHTTPException do
      begin
        case ESOAPHTTPException(E).StatusCode of
          0:
            begin
              //Application.MessageBox(PChar('Нет связи ...'),
              //                       PChar('Ошибка!'),MB_ICONERROR+MB_OK);
              Exit;
            end;

          503:
            begin
              //Application.MessageBox(PChar('Служба недоступна'),
              //                       PChar('Ошибка!'),MB_ICONERROR+MB_OK);
              Exit;
            end;
        end;
      end;

      on E: ERemotableException do
      begin
        log.Lines.Add('#' + IntToStr(FINMaterialsList.list[i].code) + '$');
        log2.lines.Add(IntToStr(FINMaterialsList.list[i].code) + ' : ' + e.Message);
        Application.ProcessMessages;
        //raise;
      end;

      on E: Exception do
      begin
        log2.Lines.Add('error: ' + IntToStr(FINMaterialsList.list[i].code) + ' : ' +  e.message);
        //raise;
        Exit;
      end;

    end;
  end;


  if (fkOrderCode <> LOW_INT) then
  begin
       itemFilter := RQFKOrderItemFilter.Create;
       SetNullIntProps(itemFilter);
       SetNullXSProps(itemFilter);
       itemFilter.fkOrderRef := RQFKOrderRef.Create;
       itemFilter.fkOrderRef.code := fkOrderCode;

       TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
       itemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter, 0 , -1);

       if (itemList.totalCount > 0) then
       begin
            // скласти
            TempRQFKOrder.createdPrihod(fkOrderCode);
            // провести
            TempRQFKOrder.moveRashodInFK(fkOrderCode);
       end else
       begin
            TempRQFKOrder.remove(fkOrderCode);
       end;
  end;

{
  Application.MessageBox(PChar('Перелік матеріалів: ' + str),
                         PChar('Повідомлення'),
                         MB_ICONINFORMATION);
}

  Application.MessageBox(PChar('Формування внутрішніх переміщень завершено!'),
                         PChar('Повідомлення'),
                         MB_ICONINFORMATION);

end;

procedure TfrmConvertTranzit2OperativeEdit.Button1Click(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    dateGen: TXSDate;
begin
  EXIT;

  ///////////////////////////////////////////////////

  if Application.MessageBox(PChar('Створити ордер?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  if not dtpDateGen.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату ордеру!'),
                           PChar('Увага !'),
                           MB_ICONWARNING+MB_OK);
    Exit;
  end;

  dateGen := TXSDate.Create;
  dateGen.XSToNative(GetXSDate(dtpDateGen.DateTime));

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  ShowMessage(IntToStr(TempRQFKOrder.createRQFKOrderForTranzit2Operative('5154', 'Щедрін О.Ю. ст.майстер 1 гр', dateGen)));

  Application.MessageBox(PChar('Ордер створено!'),
                         PChar('Повідомлення'),
                         MB_ICONINFORMATION);
end;

end.

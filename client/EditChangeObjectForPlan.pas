unit EditChangeObjectForPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ENElementTypeController;

type
  TfrmChangeObjectForPlanEdit = class(TDialogForm)
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    btnOk: TButton;
    btnCancel: TButton;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkState: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    elementCode: Integer;
    planStateCode: Integer;
    elementType: Integer;
  public
    { Public declarations }
    planCode: Integer;
    changePlanWorkState : Boolean;
  end;

var
  frmChangeObjectForPlanEdit: TfrmChangeObjectForPlanEdit;

implementation

uses ENElementController, ENPlanWorkController, ENConsts, ShowENElement,
  ChildFormUnit, ShowENPlanWorkState, ENPlanWorkStateController;

{$R *.dfm}

procedure TfrmChangeObjectForPlanEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtENElementName]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      if elementCode = LOW_INT then
        raise Exception.Create('NET-4337 Не задано об''єкт планування!');

      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      ENPlanWorkObj := TempENPlanWork.getObject(planCode);

      { Проверка инвентарного номера
      SUPP-47771 Исключаем капстрой, т.к. там могут быть планы на объекты
      без инвентарного номера}
      if (ENPlanWorkObj.stateRef.code <> ENPLANWORKSTATE_CAPITALBUILDER) and
         (planStateCode <> ENPLANWORKSTATE_CAPITALBUILDER) then
      begin
        if not NoBlankValues([edtInvNumber]) then begin
          Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
          Action := caNone;
          Exit;
        end;
      end;


      if (changePlanWorkState) then
      begin
        ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create;
        ENPlanWorkObj.stateRef.code := planStateCode;
        TempENPlanWork.changePlanState(ENPlanWorkObj);
      end else
      begin
        ENPlanWorkObj.elementRef := ENElementRef.Create;
        ENPlanWorkObj.elementRef.code := elementCode;
        ///// Пока не будем это открывать
        // ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create;
        // ENPlanWorkObj.stateRef.code := planStateCode;
        /////

        if (elementType = EN_CALLCENTER_OBJECT) then
          TempENPlanWork.changeObjectForCallCenterAVRPlan(ENPlanWorkObj)
        else
          TempENPlanWork.changeObjectOfPlanning(ENPlanWorkObj);
      end;
    end;
end;

procedure TfrmChangeObjectForPlanEdit.FormCreate(Sender: TObject);
begin
  planCode := LOW_INT;
  elementCode := LOW_INT;
  planStateCode := LOW_INT;
  elementType := LOW_INT;
end;


procedure TfrmChangeObjectForPlanEdit.FormShow(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;
  TempENElement: ENElementControllerSoapPort;
  eFilter: ENElementFilter;
  eList: ENElementShortList;
  stateObj : ENPlanWorkState;
  TempENPlanWorkState : ENPlanWorkStateControllerSoapPort;
begin
  // Пока спрячем
  HideControls([lblWorkState, edtWorkState, spbENPlanWorkState]);

  DisableControls([edtENElementName, edtInvNumber, edtWorkState]);
  DenyBlankValues([edtENElementName, edtInvNumber, edtWorkState]);

  if planCode = LOW_INT then
    //Exit;
    raise Exception.Create('NET-4337 Не вказано код плану!');

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  ENPlanWorkObj := TempENPlanWork.getObject(planCode);

  if ENPlanWorkObj = nil then
    raise Exception.Create('NET-4337 План не знайдено! Код плану: ' + IntToStr(planCode));

  if ENPlanWorkObj.elementRef = nil then
    raise Exception.Create('NET-4337 Не знайдено об''єкт планування! Код плану: ' + IntToStr(planCode));

  if ENPlanWorkObj.elementRef.code = LOW_INT then
    raise Exception.Create('NET-4337 Не знайдено об''єкт планування! Код плану: ' + IntToStr(planCode));

  if (changePlanWorkState) then
  begin
    HideControls([lblWorkState, edtWorkState, spbENPlanWorkState], False);
    HideControls([lblEnElement, edtENElementName, spbENElement, lblInvNumber, edtInvNumber]);
    lblWorkState.Top := 18;
    edtWorkState.Top := 15;
    spbENPlanWorkState.Top := 15;
    frmChangeObjectForPlanEdit.Caption := 'Зміна типу акта';

    TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
    stateObj := TempENPlanWorkState.getObject(ENPlanWorkObj.stateRef.code);
    if (stateObj <> nil) then
    begin
      edtWorkState.Text := stateObj.name;
    end;
  end;


  elementCode := ENPlanWorkObj.elementRef.code;

  eFilter := ENElementFilter.Create;
  try
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    eFilter.code := ENPlanWorkObj.elementRef.code;

    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;

    eList := TempENElement.getScrollableFilteredList(eFilter, 0, -1);
    if eList.totalCount > 0 then
    begin
      edtENElementName.Text := eList.list[0].objectName;
      edtInvNumber.Text := eList.list[0].objectInvNumber;

      elementType := eList.list[0].typeRefCode;
    end;
  finally
    eFilter.Free;
  end;
end;

procedure TfrmChangeObjectForPlanEdit.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
{ SUPP-87384 Открываем для всех
  if (elementType <> EN_CALLCENTER_OBJECT) and (HTTPRIOENPlanWork.HTTPWebNode.UserName <> 'energynet') then
  begin
    if f.typeRef = nil then f.typeRef := ENElementTypeRef.Create;
    f.typeRef.code := elementType;
  end;
}
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);
  try
    DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit, frmENElementShow.actDelete]);
    { SUPP-87384 Открываем для всех
    if (elementType <> EN_CALLCENTER_OBJECT) and (HTTPRIOENPlanWork.HTTPWebNode.UserName <> 'energynet') then
    begin
      frmENElementShow.isFiltered := True;
      frmENElementShow.changeElement := True;
      frmENElementShow.elementType := elementType;
    end;
    }

    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          //if ENPlanWorkObj.elementRef = nil then ENPlanWorkObj.elementRef := ENElementRef.Create();
          //ENPlanWorkObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));

          elementCode := StrToInt(GetReturnValue(sgENElement, 0));
          edtENElementName.Text := GetReturnValue(sgENElement, 1);
          edtInvNumber.Text := GetReturnValue(sgENElement, 3);

          edtWorkState.Text := '';
          planStateCode := LOW_INT;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmChangeObjectForPlanEdit.spbENPlanWorkStateClick(Sender: TObject);
var
  frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
  f: ENPlanWorkStateFilter;
  TempENElement: ENElementControllerSoapPort;
  e: ENElement;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkObj: ENPlanWork;
begin
  if planCode = LOW_INT then
    raise Exception.Create('NET-4337 Не вказано код плану!');

  if elementCode = LOW_INT then
    raise Exception.Create('NET-4337 Не вказано об''єкт планування!');

  f := ENPlanWorkStateFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if (changePlanWorkState) then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if ENPlanWorkObj = nil then
      raise Exception.Create('NET-4337 План не знайдено! Код плану: ' + IntToStr(planCode));

    f.orderBySQL := 'ordered';
    f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode ' +
     ' from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkObj.typeRef.code) +')';

  end else
  begin
    f.orderBySQL := 'ordered';
    f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate ' +
                    'where enplantype2planstate.typerefcode = '+ IntToStr(ENPLANWORKTYPE_AVR) +')';
  end;

  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;

  e := TempENElement.getObject(elementCode);

  elementType := e.typeRef.code;

  if (e.typeRef.code <> EN_SUBSTATION150) and
   (e.typeRef.code <> EN_BUILDER) and
   (e.typeRef.code <> EN_METROLOGY_COUNTER) and
   (e.typeRef.code <> EN_METROLOGY_DEVICE) and
   (e.typeRef.code <> EN_METROLOGY_OBJECT) and
   (e.typeRef.code <> EN_BYT) and
   (e.typeRef.code <> EN_TRANSPORT) and
   (e.typeRef.code <> EN_SIT) and
   (e.typeRef.code <> EN_PURCHASES_OBJECT) and
   (e.typeRef.code <> EN_PURCHASES_NO_OBJECT) and
   (e.typeRef.code <> EN_SIZ_OBJECT) and
   (e.typeRef.code <> EN_SERVICES_OBJECT) and
   (e.typeRef.code <> EN_PREPRODUCTION_OBJECT) and
   (e.typeRef.code <> EN_EQUIPMENT_REPAIR) then
  f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);

  if (e.typeRef.code = EN_EQUIPMENT) then
  begin
   {SUPP-7483}
   f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code in (' + IntToStr(ENPLANWORKSTATE_CAPITALREPAIR) + ', ' + IntToStr(ENPLANWORKSTATE_TECHNICALSERVICE) +')';
  end;

   frmENPlanWorkStateShow := TfrmENPlanWorkStateShow.Create(Application, fmNormal, f);
   try
      with frmENPlanWorkStateShow do
      begin
        DisableActions([actEdit, actInsert, actDelete, actNoFilter, actFilter]);
        if ShowModal = mrOk then
        begin
          try
            //if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
            //ENPlanWorkObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState, 0));
            planStateCode := StrToInt(GetReturnValue(sgENPlanWorkState, 0));
            edtWorkState.Text:= GetReturnValue(sgENPlanWorkState, 1);
          except
             on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

end.

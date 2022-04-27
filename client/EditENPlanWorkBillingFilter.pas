
unit EditENPlanWorkBillingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    DateUtils
	,EnergyproController, EnergyproController2, ENPlanWorkController
  , ShowENPlanWorkBilling
   ;

type
  TfrmENPlanWorkBillingFilterEdit = class(TDialogForm)
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblYearGen : TLabel;
    lblMonthGen : TLabel;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENPlanWorkStatusName : TLabel;
  edtENPlanWorkStatusName: TEdit;
  spbENPlanWorkStatus: TSpeedButton;
  

  HTTPRIOENPlanWork: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbType: TSpeedButton;
    edtTypeName: TEdit;
    lblTypeName: TLabel;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbResponsibility: TSpeedButton;
    spbDepartment: TSpeedButton;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    edtResponsibility: TEdit;
    lblResponsibility: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    cbElementType: TComboBox;
    lblElementType: TLabel;
    lblENPlanWorkKindKindName: TLabel;
    cbPlanWorkKind: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    edtWorkOrderNumber: TEdit;
    lblWorkOrderNumber: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblPlanWorkForm: TLabel;
    lblNumberList: TLabel;
    edtNumberList: TEdit;
    Label1: TLabel;
    edtPriConnectionNumber: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    cbShowPlanEneOz: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkStatusClick(Sender : TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtYearGenDropDown(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    isFilter_, isTransport, isOperative, isWriteOffProtection : boolean;
    disableControlsType :  TDisableType;
end;

var
  frmENPlanWorkBillingFilterEdit: TfrmENPlanWorkBillingFilterEdit;
  ENPlanWorkFilterObj: ENPlanWorkFilter;


implementation

uses
  ShowENPlanWorkStatus
  ,ENPlanWorkStatusController
, ENElementController, ShowENElement, DMReportsUnit,
  ENDepartmentController, ShowENDepartment, ENDepartmentTypeController,
  ENConsts, ShowENPlanWorkType, ENPlanWorkTypeController,
  ENElementTypeController, ENPlanWorkKindController, EditENPlanWorkState,
  ShowENPlanWorkState, ENPlanWorkMoveReasonController,
  ENPlanWorkStateController, ENPlanWorkFormController;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkBillingFilterEdit.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i, idx, idxOperative , idxNoObject : integer;
begin
   //edtYearGen.ItemIndex := 2;
   //edtMonthGen.ItemIndex := monthof(date);

  /////
  btnOk.Top := 350;
  btnCancel.Top := 350;
  Height := btnOk.Top + btnOk.Height + 50;
  /////

  SetIntStyle([edtCode]);

  if disableControlsType = dtMetrology then
  begin
       ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
       ENPlanWorkFilterObj.kind.code := ENPLANWORKKIND_CURRENT;
       cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT ;

       cbElementType.Clear;
       cbElementType.Items.AddObject(':)', TObject(LOW_INT));
       cbElementType.Items.AddObject('Метрологія - поточні плани', TObject(EN_METROLOGY_OBJECT));
       cbElementType.ItemIndex := 1;

       edtENBudgetName.Text := 'Метрологія';
       ENPlanWorkFilterObj.budgetRef := ENDepartmentRef.Create;
       ENPlanWorkFilterObj.budgetRef.code := ENBUDGET_METROLOGY;

       DisableControls([cbPlanWorkKind, cbElementType, spbENBudget]);
  end
  else
  begin
      cbElementType.Clear;

      f:= ENElementTypeFilter.Create;
      SetNullIntProps(f);
      //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10)';
      //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';
      f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';
      f.orderBySQL := 'code';

      idxOperative := -1;

      //cbElementType.Items.Add('');
      cbElementType.Items.AddObject(' ', TObject(LOW_INT));

      TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
      ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
      for i:=0 to ENElementTypeList.totalCount-1 do
      begin
        idx := cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
        if ENElementTypeList.list[i].code = EN_OPERATIVE_OBJECT then
          idxOperative := idx;
        if ENElementTypeList.list[i].code = EN_WRITING_NO_OBJECT then
          idxNoObject := idx;
       end;

      if isOperative then
        if idxOperative > -1 then
        begin
          cbElementType.ItemIndex := idxOperative;
          DisableControls([cbElementType]);
        end;

      cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;
  end;

  if isWriteOffProtection then
   begin
   DisableControls([cbElementType]);
   cbElementType.ItemIndex := idxNoObject;
   end;


{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtYearGen
      ,edtMonthGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanWorkObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkObj.dateGen.Year,ENPlanWorkObj.dateGen.Month,ENPlanWorkObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENPlanWorkObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENPlanWorkObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( ENPlanWorkObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENPlanWorkObj.monthGen)
    else
       edtMonthGen.Text := '';



    edtCommentGen.Text := ENPlanWorkObj.commentGen; 



    edtUserGen.Text := ENPlanWorkObj.userGen; 



      if ENPlanWorkObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkObj.dateEdit.Year,ENPlanWorkObj.dateEdit.Month,ENPlanWorkObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}


end;



procedure TfrmENPlanWorkBillingFilterEdit.edtYearGenDropDown(Sender: TObject);
begin
  inherited;
  if edtYearGen.ItemIndex = -1 then begin
    edtYearGen.ItemIndex := edtYearGen.Items.Count - 3;
  end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
 condition : String;
begin
  if (ModalResult = mrOk)  then
  begin
     //isFilter := true;

     ENPlanWorkFilterObj.commentGen := edtCommentGen.Text;

     if (edtCode.Text <> '') then
     begin
       try
         ENPlanWorkFilterObj.code := StrToInt(edtCode.Text);
         isFilter_ := true;
       except
         on EConvertError do
         begin
           ENPlanWorkFilterObj.code := LOW_INT;
           //isFilter_ := false;
         end;
       end;
     end;

     if (edtYearGen.ItemIndex >= 1) then
     begin
       ENPlanWorkFilterObj.yearGen := edtYearGen.ItemIndex + 2008;
       isFilter_ := true;
     end
     else
       ENPlanWorkFilterObj.yearGen := Low(Integer) ;

     if cbENPlanWorkFormName.ItemIndex > 0 then
     begin
        ENPlanWorkFilterObj.formRef := ENPlanWorkFormRef.Create;
        ENPlanWorkFilterObj.formRef.code := cbENPlanWorkFormName.ItemIndex;
        isFilter_ := true;
     end;

     if (edtMonthGen.ItemIndex >= 1) then
     begin
       ENPlanWorkFilterObj.monthGen := edtMonthGen.ItemIndex;
       isFilter_ := true;
     end
     else
       ENPlanWorkFilterObj.monthGen := Low(Integer) ;

     if cbPlanWorkKind.ItemIndex > 0 then
     begin
        if ENPlanWorkFilterObj.kind = nil then ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
        ENPlanWorkFilterObj.kind.code := cbPlanWorkKind.ItemIndex ;
        isFilter_ := true;
     end;
   {   if edtWorkState.Text <> '' then
     begin
        if ENPlanWorkFilterObj.stateRef = nil then ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create;
        ENPlanWorkFilterObj.stateRef.code := ENPlanWorkStateRef ;
     end;       }
     condition := '';

     if edtdateStart.checked then
     begin
       AddCondition(condition, 'enplanwork.datestart >= to_date(''' + DateToStr(edtDateStart.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := true;
     end;

     if edtdateFinal.checked then
     begin
       AddCondition(condition, 'enplanwork.datefinal <= to_date(''' + DateToStr(edtDateFinal.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := true;
     end;

     if cbElementType.ItemIndex > 0 then
     begin
       AddCondition(condition, 'enplanwork.elementrefcode in (select enelement.code from enelement where enelement.typerefcode = '+ IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex])) +')');
       isFilter_ := true;
     end;

     if edtWorkOrderNumber.Text <> '' then
     begin
       AddCondition(condition,
         'enplanwork.code in ' +
         '(select wp.plancode from enworkorder2enplanwork wp where wp.workordercode in ' +
         ' (select w.code from enworkorder w where UPPER(w.workordernumber) like UPPER(''' + ToLIKE(edtWorkOrderNumber.Text) + ''')) ' +
         ') and enplanwork.kindcode in (' + IntToStr(ENPLANWORKKIND_NPZ) + ', ' + IntToStr(ENPLANWORKKIND_FACT) + ')'
       );
       isFilter_ := true;
     end;

     if edtNumberList.Text <> '' then
     begin
       AddCondition(condition,
         'enplanwork.code in ' +
         '(select ti.planrefcode from entransportitem ti ' +
         ' where ti.numberlist like UPPER(''' + ToLIKE(edtNumberList.Text) + ''') ' +
         ') '
       );
       isFilter_ := true;
     end;

     if edtPriConnectionNumber.Text <> '' then
     begin
       ENPlanWorkFilterObj.priConnectionNumber := edtPriConnectionNumber.Text;
       isFilter_ := true;
     end;

     // не показываем кошторис единичный
     AddCondition(condition, ' kindcode <> ' + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE) );

     {
     if cbShowPlanEneOz.Checked then
     begin
         AddCondition(condition, 'enplanwork.budgetrefcode <> 240000001');
     end;
     }

     ENPlanWorkFilterObj.conditionSQL := condition;

     if not isFilter_ then
     begin
        Application.MessageBox(PChar('Виберіть хоча б один критерій пошуку ...'), PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
     end;
  end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.spbENPlanWorkStatusClick(Sender : TObject);
var
   frmENPlanWorkStatusShow: TfrmENPlanWorkStatusShow;
begin
   frmENPlanWorkStatusShow:=TfrmENPlanWorkStatusShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.status = nil then ENPlanWorkFilterObj.status := ENPlanWorkStatus.Create();
               ENPlanWorkFilterObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               edtENPlanWorkStatusName.Text:=GetReturnValue(sgENPlanWorkStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkStatusShow.Free;
   end;
end;





procedure TfrmENPlanWorkBillingFilterEdit.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
   //o : EN
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
     //f.conditionSQL := 'code in (select elementrefcode from enline10 union all select elementcode from enlin150 union all select elementrefcode from ensubstation10 union all select elementrefcode from ensubstation150)
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try
     if isTransport then frmENElementShow.isTransport := true;
     if isOperative then frmENElementShow.isOperative := true;
     if isWriteOffProtection then frmENElementShow.isWriteOffProtection := true;
      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               //enObj := DMReports.getIByElement(StrToInt(GetReturnValue(sgENElement,0)));
               {
               invNum := GetReturnValue(sgENElement,3) ; //DMReports.getInvNumByElement(StrToInt(GetReturnValue(sgENElement,0)));
               if (length(invNum) < 5) then
               begin
                   Application.MessageBox(PChar('Плани можливо заносити тільки для об"єктів з інвентарним номером !!!' + ' ' + invNum +' < 5 символов'), PChar('Ошибка'), MB_ICONERROR);
                   exit;
               end;
               }


               if ENPlanWorkFilterObj.elementRef = nil then ENPlanWorkFilterObj.elementRef := ENElementRef.Create();
              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkFilterObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
               isFilter_ := true;
               {
               if  ENPlanWorkFilterObj.renRef = nil then ENPlanWorkFilterObj.renRef := EPRenRef.Create;
               ENPlanWorkFilterObj.renRef.code := ENElementShort(sgENElement.Objects[0,sgENElement.Row]).renRefCode ;
               edtEPRenName.Text := GetReturnValue(sgENElement,2);

               // подкинуть депртамент ...
              depShort := DMReports.getDepartmentByRenCode(ENPlanWorkFilterObj.renRef.code);
              if depShort <> nil then
              begin
                  if ENPlanWorkFilterObj.departmentRef = nil then  ENPlanWorkFilterObj.departmentRef := ENDepartmentRef.Create;
                  ENPlanWorkFilterObj.departmentRef.code := depShort.code;
                  edtDepartment.Text:= depShort.shortName;
              end;
              }
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';
   
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.budgetRef = nil then ENPlanWorkFilterObj.budgetRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.spbResponsibilityClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_RESPOSIBILITY;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.responsibilityRef = nil then ENPlanWorkFilterObj.responsibilityRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.responsibilityRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtResponsibility.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;
   if ENPlanWorkFilterObj.elementRef <> nil then
      if ENPlanWorkFilterObj.elementRef.code > low(Integer) then
         if ENPlanWorkFilterObj.renRef <> nil then
            if ENPlanWorkFilterObj.renRef.code > low(Integer) then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkFilterObj.renRef.code) +')';
               f.code := Low(integer);
            end;





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.departmentRef = nil then ENPlanWorkFilterObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPlanWorkBillingFilterEdit.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.typeRef = nil then ENPlanWorkFilterObj.typeRef := ENPlanWorkTypeRef.Create();
               ENPlanWorkFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmENPlanWorkBillingFilterEdit.spbENPlanWorkStateClick(
  Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin
      DisableActions([ actEdit, actInsert ],DialogState = dsView  );
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.stateRef = nil then ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create();
               ENPlanWorkFilterObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;
procedure TfrmENPlanWorkBillingFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isFilter_ := false;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, false);
end;

end.

unit ENPeriodFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmENPeriod = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    GroupBox1: TGroupBox;
    chbByRENs: TCheckBox;
    chbByBudgets: TCheckBox;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    GroupBox2: TGroupBox;
    rbYear: TRadioButton;
    rbTekush: TRadioButton;
    rbNpz: TRadioButton;
    rbFakt: TRadioButton;
    chbYearPlansOnly: TCheckBox;
    lblren: TLabel;
    edtren: TEdit;
    spbren: TSpeedButton;
    lblBelonging: TLabel;
    cbBelongingType: TComboBox;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    chkisPlanFact: TCheckBox;
    chk010111: TCheckBox;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbrenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  private
    { Private declarations }
	public
		{ Public declarations }
		renCode: Integer;
		renName: String;
		elementCode: Integer;
		elementName: String;
		budgetCode: Integer;
		budgetName: String;

		renCode2: Integer;
		renName2: String;

    geoDeptCode : Integer;
    geoDeptName : String;
  end;

var
  frmENPeriod: TfrmENPeriod;

implementation

{$R *.dfm}
uses ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , ShowENElement, ENElementController , EnergyproController , ShowENEPRen,
  ENElementTypeController, ShowENGeographicDepartment,
  ENGeographicDepartmentController;

procedure TfrmENPeriod.spbEPRenClick(Sender: TObject);
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
 {  if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > low(Integer) then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;    }





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            {try
               if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;}
          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
          // скрываем счек бокс для подразделения
          if renCode > 0 then chbByRENs.Checked := false;
          HideControls([chbByRENs], (renCode > 0));
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriod.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);

end;

procedure TfrmENPeriod.spbENBudgetClick(Sender: TObject);
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

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;
              /// скрываем чек бокс по бюджетодержателям
              if budgetCode > 0 then chbByBudgets.Checked := false;
              HideControls([chbByBudgets], (budgetCode > 0));
              ///
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPeriod.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);

end;

procedure TfrmENPeriod.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';

  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
			begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;
          ///
         // if elementCode > 0 then chbByObjects.Checked := false;
         //  HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENPeriod.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';


end;

procedure TfrmENPeriod.spbrenClick(Sender: TObject);
var
	 frmEPRenShow: TfrmENEPRenShow;
begin
	 frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try

							 renCode2 := StrToInt(GetReturnValue(sgEPRen,0));
							 renName2 := GetReturnValue(sgEPRen,1);
							 edtren.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmENPeriod.btnGeographClearClick(Sender: TObject);
begin
  inherited;
   geoDeptCode := 0;
   geoDeptName := '';
   edtGeograph.Text := '';

end;

procedure TfrmENPeriod.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  if renCode <> 0 then //departmentcode
   Filter.conditionSQL := ' ENGEOGRAPHICDEPARTMENT.CODE in ( select ee.geodepartmentrefcode ' +
                          ' from engeodep2endepartment ee '+
                          ' where ee.departmentrefcode  = ' + IntToStr(renCode) + ')';

   if ((renCode2 <> 0) and (renCode2 <> -1) ) then //rencode
   Filter.conditionSQL :=  ' ENGEOGRAPHICDEPARTMENT.CODE in  ' +
                           ' (select ee.geodepartmentrefcode from engeodep2endepartment ee ' +
                           ' where ee.departmentrefcode  in (select ee.departmentrefcode from endepartment2epren ee ' +
                           ' where ee.renrefcode = ' + IntToStr(renCode2) + ')'  +
                           ' ) ';


  //Filter.code := 1;
  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin geoDeptCode := 0; Exit; end;
                end;
                 geoDeptCode := selected.code;
                 geoDeptName := selected.name;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENPeriod.FormShow(Sender: TObject);
var
 f : ENElementTypeFilter;
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 i  , idx : integer;
begin

   geoDeptCode := 0;
   geoDeptName := '';
   edtGeograph.Text := '';

	 renCode2:= -1;
	 renName2:='';
   DisableControls([edtren]);
   HideControls([lblren , edtren , spbren ]); // скроем , так как переходим на гео. подразделения

   SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 5, false, true);
   DisableControls([edtGeograph]);
   begin
      cbElementType.Clear;

      f:= ENElementTypeFilter.Create;
      SetNullIntProps(f);
      f.conditionSQL := ' code in ('+ IntToStr(ENELEMENTTYPE_PL6_10) + ','+IntToStr(ENELEMENTTYPE_PL04) + ',' + IntToStr(ENELEMENTTYPE_PL35_150) +')';
      f.orderBySQL := 'code';

      cbElementType.Items.AddObject(' ', TObject(LOW_INT));

      TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
      ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
      for i:=0 to ENElementTypeList.totalCount-1 do
      begin
        idx := cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
       end;

      cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;
  end;
end;

end.

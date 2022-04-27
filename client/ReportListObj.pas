unit ReportListObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, Rio, SOAPHTTPClient, StdCtrls, CheckLst, Buttons , DialogFormUnit , ChildFormUnit ;

type
  TfrmListObjReport = class(TDialogForm)
    HTTPRIOENPlanWorkState: THTTPRIO;
    Listenplanworkstate: TCheckListBox;
    Label1: TLabel;
    lblYearGenS: TLabel;
    edtYear: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    edtENElementName: TEdit;
    cbElementType: TComboBox;
    lblElementType: TLabel;
    HTTPRIOENElementType: THTTPRIO;
    listenplanworktype: TCheckListBox;
    lblEnplanworktype: TLabel;
    HTTPRIOENPlanWorkType: THTTPRIO;
    chkListByWork: TCheckBox;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    chkYearPlanGraph: TCheckBox;
    Label2: TLabel;
    listNominalVoltage: TCheckListBox;
    HTTPRIOEPVoltageNominal: THTTPRIO;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    axorgID: string;
  end;

var
  frmListObjReport: TfrmListObjReport;
  depName:string;
  depcode:integer;
  budgCode:Integer;
  elementCode:Integer;

implementation

uses ENPlanWorkStateController, EnergyproController, ShowENDepartment,
  ENDepartmentController, ENDepartmentTypeController, ENConsts, ShowENElement,
  ENElementController, DMReportsUnit, ENElementTypeController,
  ENPlanWorkTypeController, ShowFINExecutorTree, FINExecutorController;

{$R *.dfm}

procedure TfrmListObjReport.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
  reportName: String;
  strplanworkstate, strPlanForm , strplanworktype , strnominalvalue , childFinExecutorCond  : String;
  i : Integer;
begin
/////// Parameters
      SetLength(argNames, 14);
      SetLength(args, 14);

      argnames[1] := 'yearGen';
        args[1] :=  edtYear.Text;

        strplanworkstate := '-1';
        // —читывание выбранных типов актов
        for i := 0 to Listenplanworkstate.Count - 1 do
        begin
          if  Listenplanworkstate.Checked[i] then
            if strplanworkstate <>  '' then
              strplanworkstate := strplanworkstate + ', ' + IntToStr(  Integer( Listenplanworkstate.Items.Objects[i] ) )
            else
              strplanworkstate := strplanworkstate + IntToStr(Integer(Listenplanworkstate.Items.Objects[i]));
        end;

        argnames[2] := 'strplanworkstate';
        args[2] :=  strplanworkstate;

        argNames[3] := 'depCode';
      if depCode <> 0 then
        args[3] := IntToStr(depCode)
      else args[3] := '0';

      argnames[4] := 'budgCode';
      args[4] := IntToStr(budgCode);

      argnames[5] := 'elementCode';
      args[5] := IntToStr(elementCode);

      argnames[6] := 'elementTypeCode';
      if cbElementType.ItemIndex > 0 then
     begin
       args[6] :=  IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex]))

     end
     else
       args[6] := '0';


        strplanworktype := '-1';
        // —читывание выбранных под видов работ
        for i := 0 to listenplanworktype.Count - 1 do
        begin
          if  listenplanworktype.Checked[i] then
            if strplanworktype <>  '' then
              strplanworktype := strplanworktype + ', ' + IntToStr(  Integer( listenplanworktype.Items.Objects[i] ) )
            else
              strplanworktype := strplanworktype + IntToStr(Integer(listenplanworktype.Items.Objects[i]));
        end;

        argnames[7] := 'strplanworktype';
        args[7] :=  strplanworktype;

     argnames[8] := 'planformcode';
     if cbENPlanWorkFormName.ItemIndex > 0 then
     begin
        args[8] := IntToStr(cbENPlanWorkFormName.ItemIndex);
     end
     else
        args[8] := '0';

    strnominalvalue := '';
        // —читывание номиналов напр€жений
        for i := 0 to listNominalVoltage.Count - 1 do
        begin
          if  listNominalVoltage.Checked[i] then
            if strnominalvalue <>  '' then
              strnominalvalue := strnominalvalue + ', ' + IntToStr(  Integer( listNominalVoltage.Items.Objects[i] ) )
            else
              strnominalvalue := strnominalvalue + IntToStr(Integer(listNominalVoltage.Items.Objects[i]));
        end;

        argnames[9] := 'strnominalvalue';
        if strnominalvalue <> '' then
           strnominalvalue := ' and p.elementrefcode in ( ' +
            ' select e.elementcode from ensubstation150 e  '  +
            ' where e.voltagecode in ('+ strnominalvalue +') '  +
             ' ) '
         else  strnominalvalue := 'and 1=1';
        args[9] :=  strnominalvalue;

       argnames[10] := 'FinExecutorCond';
       if (Length(axorgID)>0 ) then
       begin
         childFinExecutorCond := DMReports.getStrAllFINExecutorIdsByParent(axorgID);

         args[10] :=  ' and p.finexecutorcode in (' +
            'select fe.code from finexecutor fe where fe.axorgid in (' + childFinExecutorCond + '))' ;
       end
       else
       args[10] :=  ' and 1=1' ;


       if chkListByWork.Checked then
       reportName := 'ListObject/ListObjMainByWork'
       else if chkYearPlanGraph.Checked then
       reportName := 'ListObject/ListObjByOneWork'
       else
       reportName := 'ListObject/ListObjMain';


       makeReport(reportName, argNames, args, 'xlsx');

end;

procedure TfrmListObjReport.FormShow(Sender: TObject);
var
  TempENPlanworkstate :  ENPlanworkstateControllerSoapPort;
  stateFilter : ENPlanWorkStateFilter;
  stateList : ENPlanWorkStateShortList;
  stateIndex : Integer;


 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 idx , ii: Integer;

  TempENPlanworkType :  ENPlanworkTypeControllerSoapPort;
  typeFilter : ENPlanWorkTypeFilter;
  typeList : ENPlanWorkTypeShortList;
  typeIndex : Integer;

  TempEPVoltageNominal: EPVoltageNominalControllerSoapPort;
  voltage: Integer;
  EPVoltageNominalList: EPVoltageNominalShortList;
  EPVoltageNominalFil : EPVoltageNominalFilter;
begin
 elementCode := 0;
 DisableControls([edtEPRenName,edtENBudgetName,edtENElementName , edtFINExecutorName ]);

  TempEPVoltageNominal :=  HTTPRIOEPVoltageNominal as EPVoltageNominalControllerSoapPort;


   EPVoltageNominalFil := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFil);
   SetNullXSProps(EPVoltageNominalFil);


  EPVoltageNominalList := TempEPVoltageNominal.getScrollableFilteredList(EPVoltageNominalFil,0,-1);
  for voltage := 0 to EPVoltageNominalList.totalCount - 1 do begin
      listNominalVoltage.Items.AddObject(EPVoltageNominalList.list[voltage].value.NativeToXS, TObject(EPVoltageNominalList.list[voltage].code ));
  end;


  TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
  stateFilter := ENPlanWorkStateFilter.Create;
  SetNullXSProps(stateFilter);
  SetNullIntProps(stateFilter);
  stateFilter.orderBySQL := 'enplanworkstate.CODE ASC';
  stateList := TempENPlanWorkState.getScrollableFilteredList(stateFilter, 0, -1);

  for stateIndex := 0 to stateList.totalCount - 1 do begin
      Listenplanworkstate.Items.AddObject(stateList.list[stateIndex].name, TObject(stateList.list[stateIndex].code ));
  end;

  TempENPlanworkType :=  HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
  typeFilter := ENPlanWorkTypeFilter.Create;
  SetNullXSProps(typeFilter);
  SetNullIntProps(typeFilter);
  typeFilter.orderBySQL := 'enplanworktype.CODE ASC';
  typeList := TempENPlanworkType.getScrollableFilteredList(typeFilter, 0, -1);

  for typeIndex := 0 to typeList.totalCount - 1 do begin
      listenplanworktype.Items.AddObject(typeList.list[typeIndex].name, TObject(typeList.list[typeIndex].code ));
  end;

  SetComboBoxCurrentYear(edtYear, 3, 1);

  depCode:=0;


      cbElementType.Clear;

      f:= ENElementTypeFilter.Create;
      SetNullIntProps(f);
      f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE;
      f.orderBySQL := 'code';

     cbElementType.Items.AddObject(' ', TObject(LOW_INT));

      TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
      ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
      for ii:=0 to ENElementTypeList.totalCount-1 do
      begin
        idx := cbElementType.Items.AddObject(ENElementTypeList.list[ii].name, TObject(ENElementTypeList.list[ii].code));

       end;



      cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;


end;

procedure TfrmListObjReport.spbENBudgetClick(Sender: TObject);
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
              budgCode := ENDepartmentShort(tvDep.Selected.Data).code;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

              ///

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

procedure TfrmListObjReport.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
     frmENElementShow.isFiltered := True;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
         // elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := GetReturnValue(sgENElement,1);


        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmListObjReport.spbEPRenClick(Sender: TObject);
var
   frmENDepartmentShow : TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   TempENDepartment : ENDepartmentControllerSoapPort;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
          TempENDepartment := Self.HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
          depName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := depName;
          depCode := ENDepartmentShort(tvDep.Selected.Data).code; //TempENDepartment.getDepartmentCodesDown(ENDepartmentShort(tvDep.Selected.Data).code);
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmListObjReport.spbFINExecutorClick(Sender: TObject);
var
  frmFINExecutorTreeShow : TfrmFINExecutorTreeShow;

begin
  frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application,fmNormal);

  try
    with frmFINExecutorTreeShow do
    begin
      DisableActions([actEdit, actInsert]);
      if ShowModal = mrOk then
      begin
        try

            axorgID := FINExecutorShort(tvDep.Selected.Data).axOrgId;

            edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected);


        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINExecutorTreeShow.Free;
  end;
end;

end.

unit ENPeriodWithRENFormUnitTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, CheckLst,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmENPeriodWithRENTask = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    chbWholeYear: TCheckBox;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    edtENElementName: TEdit;
    chbByMonths: TCheckBox;
    GroupBox1: TGroupBox;
    chbByRENs: TCheckBox;
    chbByObjects: TCheckBox;
    spbEPRenClear: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    chbByBudgets: TCheckBox;
    edtDateStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    CheckListBox1: TCheckListBox;
    chktransportation: TCheckBox;
    edtENTransportDepartmentName: TEdit;
    spbENTransportDepartment: TSpeedButton;
    lblTransportDepartment: TLabel;
    spbENTransportDepartmentClear: TSpeedButton;
    gbSort: TGroupBox;
    rbSortData: TRadioButton;
    rbSortTransport: TRadioButton;
    chkshownotusetransport: TCheckBox;
    spbType: TSpeedButton;
    spbClearType: TSpeedButton;
    lblType: TLabel;
    lblState: TLabel;
    spbState: TSpeedButton;
    spbClearState: TSpeedButton;
    edtStateName: TEdit;
    edtTypeName: TEdit;
    lblRenWork: TLabel;
    edtRenWork: TEdit;
    spbRenWork: TSpeedButton;
    spbRenWorkClear: TSpeedButton;
    procedure chbWholeYearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENTransportDepartmentClick(Sender: TObject);
    procedure rbSortTransportClick(Sender: TObject);
    procedure rbSortDataClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbStateClick(Sender: TObject);
    procedure spbClearTypeClick(Sender: TObject);
    procedure spbClearStateClick(Sender: TObject);
    procedure spbRenWorkClick(Sender: TObject);
    procedure spbRenWorkClearClick(Sender: TObject);
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
    transportRenCode: Integer;
    typeCode, stateCode : Integer;

    renWorkCode: Integer;

  end;

var
  frmENPeriodWithRENtask: TfrmENPeriodWithRENTask;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController ,  ENPlanWorkController,
  ENTransportDepartmentController, ShowENTransportDepartment,
  ShowENPlanWorkState, ShowENPlanWorkType;

{$R *.dfm}

procedure TfrmENPeriodWithRENtask.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
  HideControls([chbByMonths], not chbWholeYear.Checked);
end;

procedure TfrmENPeriodWithRENTask.spbEPRenClick(Sender: TObject);
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
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          if edtENTransportDepartmentName.Visible = true  then
          begin
            edtENTransportDepartmentName.Text := '';
            transportRenCode:= 0;
          end;

           chkshownotusetransport.Visible:= False;
           chkshownotusetransport.Checked:= False;

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithRENTask.spbRenWorkClearClick(Sender: TObject);
begin

  renWorkCode := 0;
  edtRenWork.Text := '';
end;

procedure TfrmENPeriodWithRENTask.spbRenWorkClick(Sender: TObject);
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
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renWorkCode := ENDepartmentShort(tvDep.Selected.Data).code;
          edtRenWork.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithRENTask.spbStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow : TfrmENPlanWorkStateShow;
begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin

        if ShowModal = mrOk then
        begin
               edtStateName.Text := GetReturnValue(sgENPlanWorkState,1);
               stateCode := StrToInt(GetReturnValue(sgENPlanWorkState,0));
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmENPeriodWithRENTask.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin

        if ShowModal = mrOk then
        begin
               edtTypeName.Text := GetReturnValue(sgENPlanWorkType,1);
               typeCode := StrToInt(GetReturnValue(sgENPlanWorkType,0));
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;

end;

procedure TfrmENPeriodWithRENTask.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName, edtENElementName , edtENBudgetName ]);
  HideControls([{lblENElementName, edtENElementName, spbENElement, spbENElementClear,} chbByMonths]);

end;

procedure TfrmENPeriodWithRENTask.rbSortDataClick(Sender: TObject);
begin
  inherited;

   if ((rbSortTransport.Checked ) and (transportRenCode > 0 )) then
    begin
      chkshownotusetransport.Visible:= True;
      chkshownotusetransport.Checked:= True;
    end
    else
    begin
      chkshownotusetransport.Visible:= False;
      chkshownotusetransport.Checked:= False;
    end;

end;

procedure TfrmENPeriodWithRENTask.rbSortTransportClick(Sender: TObject);
begin
  inherited;
   if ((rbSortTransport.Checked ) and (transportRenCode > 0 )) then
    begin
      chkshownotusetransport.Visible:= True;
      chkshownotusetransport.Checked:= True;
    end
    else
    begin
      chkshownotusetransport.Visible:= False;
      chkshownotusetransport.Checked:= False;
    end;
end;

procedure TfrmENPeriodWithRENTask.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';
  typeCode := 0;
  stateCode := 0;
  CheckListBox1.Checked[0]:= True ;
  transportRenCode := 0;
  renWorkCode := 0;
end;

procedure TfrmENPeriodWithRENTask.spbENElementClick(Sender: TObject);
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
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENPeriodWithRENTask.spbENTransportDepartmentClick(
  Sender: TObject);
var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
   f : ENTransportDepartmentFilter;
begin
   f := ENTransportDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
        DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtEPRenName.Text := '';
               renCode:= 0;

               transportRenCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentName.Text:= GetReturnValue(sgENTransportDepartment,1);
               if transportRenCode = 10000 then
                renName := 'Апарат управління'
               else
                renName := GetReturnValue(sgENTransportDepartment,1);

                 if ((rbSortTransport.Checked ) and (transportRenCode > 0 )) then
                  begin
                    chkshownotusetransport.Visible:= True;
                    chkshownotusetransport.Checked:= True;
                  end
                  else
                  begin
                    chkshownotusetransport.Visible:= False;
                    chkshownotusetransport.Checked:= False;
                  end;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithRENTask.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);
  transportRenCode := 0;
  edtENTransportDepartmentName.Text := '';
end;

procedure TfrmENPeriodWithRENtask.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
 // HideControls([chbByObjects], false);  
end;

procedure TfrmENPeriodWithRENTask.spbENBudgetClick(Sender: TObject);
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
              ///
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

procedure TfrmENPeriodWithRENTask.spbClearStateClick(Sender: TObject);
begin
  inherited;
   stateCode := 0;
   edtStateName.Text := '';
end;

procedure TfrmENPeriodWithRENTask.spbClearTypeClick(Sender: TObject);
begin
  inherited;
   typeCode := 0;
   edtTypeName.Text := '';
end;

procedure TfrmENPeriodWithRENTAsk.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);
end;

end.

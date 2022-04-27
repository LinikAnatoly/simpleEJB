unit reportUndeliveredMaterials2Company;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms , DialogFormUnit ,
  Dialogs, StdCtrls, ComCtrls, Buttons, JvExStdCtrls, JvMemo;

type
  TfrmUndeliveredMaterials2Company = class(TDialogForm)
    edtStartDate: TDateTimePicker;
    lblMonthRaznar: TLabel;
    Label1: TLabel;
    edtEndDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkgroupbyrem: TCheckBox;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    chkshowOtherPurchase: TCheckBox;
    chkIsobligatory: TCheckBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    mHelp: TJvMemo;
    Label2: TLabel;
    chkPlanStatus: TCheckBox;
    spbENBudget: TSpeedButton;
    edtENBudgetName: TEdit;
    lblENBudgetName: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure spbENPlanWorkStatusClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    planStatus : Integer;
    budgetcode : Integer;
  end;

var
  frmUndeliveredMaterials2Company: TfrmUndeliveredMaterials2Company;

implementation

uses  EnergyproController , DMReportsUnit,  ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts , ChildFormUnit,
  ENPlanWorkStatusController, ShowENPlanWork, ShowENPlanWorkStatus;

{$R *.dfm}

procedure TfrmUndeliveredMaterials2Company.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i: Integer;
  strGroupmaterials : String;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  if (not NoBlankValues([edtStartDate, edtEndDate])  )  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати період планів !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
    SetLength(argNames, 26);
    SetLength(args, 26);

    argNames[0] := 'datestart';
    if not edtStartDate.Checked then
    args[0] := '01.01.2000'
    else
    args[0] := DateToStr(edtStartDate.DateTime);

    argNames[1] := 'datefinal';
    if not edtEndDate.Checked then
    args[1] := '01.01.3000'
    else
    args[1] := DateToStr(edtEndDate.DateTime);

    argNames[2] := 'formrefcode';
    if cbENPlanWorkFormName.ItemIndex > 0 then
     begin
       args[2]  := IntToStr(cbENPlanWorkFormName.ItemIndex);
     end
    else
       args[2] := '0';

    argNames[3] := 'groupbyrem';
    if chkgroupbyrem.Checked then
     args[3] := '1'
    else
     args[3] := '0';

     argNames[4] := 'showOtherPurchase';
    if chkshowOtherPurchase.Checked then
     args[4] := '1'
    else
     args[4] := '0';

    argNames[5] := 'isobligatory';
    if chkIsobligatory.Checked then
     args[5] := '1'
    else
     args[5] := '0';

     argnames[6]:= 'rencode';
    if renCode > 0 then
     args[6] := IntTostr(renCode)
    else
     args[6] := '0';

    argnames[7]:= 'renname';
    args[7] := renName;

    argnames[8]:= 'planstatus';
    if chkPlanStatus.Checked = true then
    args[8] := '3'
    else
    args[8] := '0';

    argnames[9]:= 'budgetcode';
    args[9] := IntToStr( budgetcode );



     reportName := 'undeliveredMaterials2Company';
     makeReport(reportName, argNames, args, 'xls')
  end;

end;

procedure TfrmUndeliveredMaterials2Company.FormShow(Sender: TObject);
begin
  inherited;
   planStatus := 3; // по умолчанию статус планов утвержденный берем
   DisableControls([edtENBudgetName]);
   budgetcode := 0;
end;

procedure TfrmUndeliveredMaterials2Company.spbENBudgetClick(Sender: TObject);
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

        if ShowModal = mrOk then
        begin
            try
               budgetcode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmUndeliveredMaterials2Company.spbENPlanWorkStatusClearClick(
  Sender: TObject);
begin
   planStatus := 0;

end;


procedure TfrmUndeliveredMaterials2Company.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '0';
  edtEPRenName.Text := '';

  chkgroupbyrem.Enabled:= True;
end;

procedure TfrmUndeliveredMaterials2Company.spbEPRenClick(Sender: TObject);
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

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;

          chkgroupbyrem.Enabled := False;
          chkgroupbyrem.Checked := False;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmUndeliveredMaterials2Company.SpeedButton1Click(Sender: TObject);
begin
       budgetcode := 0;
      edtENBudgetName.Text:='';

end;

end.

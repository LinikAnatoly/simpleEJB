unit ExecuteContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit ,ChildFormUnit, Buttons, StdCtrls, ComCtrls;

type
  TfrmExecuteContract = class(TDialogForm)
    lblNumberContract: TLabel;
    edtNumberContract: TEdit;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtDateEndPriconnection: TDateTimePicker;
    lblDateEndPriconnection: TLabel;
    chkisNotExecutedWorkValue: TCheckBox;
    lblMaterial: TLabel;
    edtMaterialName: TEdit;
    spbMaterial: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    Label4: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label3: TLabel;
    dtpEndDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    materialCode : Integer;
  end;

var
  frmExecuteContract: TfrmExecuteContract;

implementation

{$R *.dfm}
uses ShowENDepartment, ENDepartmentController , ShowTKMaterials, 
  TKMaterialsController, EnergyproController, DMReportsUnit;

procedure TfrmExecuteContract.spbEPRenClick(Sender: TObject);
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
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmExecuteContract.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '0';
  edtEPRenName.Text := '';
end;

procedure TfrmExecuteContract.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 //mtFilter : TKMaterialsFilter;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);
      
      if ShowModal = mrOk then
      begin

        try
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
         
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;

end;

procedure TfrmExecuteContract.spbMaterialClearClick(Sender: TObject);
begin
  materialCode:=0;
  edtMaterialName.Text := '';
end;

procedure TfrmExecuteContract.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin

   if (ModalResult = mrOk) then
   begin
      SetLength(argNames, 10);
      SetLength(args, 10);

      argNames[0] := 'p_priconnectionnumber';
      args[0] := chr(39) + Trim(edtNumberContract.Text) + chr(39);

      argNames[1] := 'p_podr';
      if renCode <> 0 then
      args[1] := ' and p.departmentrefcode in ( ' + DMReports.getDepartmentCodesDown( renCode ) + ' ) '
      else
      args[1] := ' and 1 = 1';
      
      argNames[2] := 'p_dateendpriconnection';
      if edtDateEndPriconnection.Checked then
      args[2] := DateToStr(edtDateEndPriconnection.DateTime)
      else
      args[2] := '';


      argNames[3] := 'p_matcode';
      args[3] := IntToStr(materialCode);

      argNames[4] := 'pdateStart';
      if dtpStartDate.Checked then
      args[4] := chr(39)+DateToStr(dtpStartDate.datetime)+chr(39)
      else
      args[4] := chr(39)+'01.01.1981'+chr(39);

      argNames[5] := 'pdateFinal';
      if dtpEndDate.Checked then
      args[5] := chr(39)+DateToStr(dtpEndDate.datetime)+chr(39)
      else
      args[5] := chr(39)+'01.01.3000'+chr(39);


      argNames[6] := 'isNotExecutedWorkValue';
      if chkisNotExecutedWorkValue.Checked then
      args[6] := '1'
      else
      args[6]:= '0' ;


      argNames[7] := 'isNotExecutedWorkDate';
      args[7] := DateToStr(now);

      if Trim(edtNumberContract.Text) <> '' then
      begin
       args[1] := ' and 1 = 1';
       args[2] := '';
       args[3] := '0';
       args[4] := chr(39)+'01.01.1981'+chr(39);
       args[5] := chr(39)+'01.01.3000'+chr(39);
       args[6]:= '0' ;
      end;

      if ( (dtpStartDate.Checked ) and  ( not dtpEndDate.Checked) ) then
      begin
       Application.MessageBox(PChar('Необхідно вибрати період планів "ПО"!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
       ModalResult := mrNone;
      end ;

      if ( (not dtpStartDate.Checked ) and  ( dtpEndDate.Checked) ) then
      begin
       Application.MessageBox(PChar('Необхідно вибрати період планів "З"!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
       ModalResult := mrNone;
      end ;

      reportName := 'TechConditions/Execute_contract/execute_contract' ;
      makeReport(reportName, argNames, args, 'xls') ;

   end;
end;

procedure TfrmExecuteContract.FormCreate(Sender: TObject);
begin
    renCode:= 0;
    materialCode :=0;
end;

end.

unit reportExecPriconectionContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls , DialogFormUnit ,ChildFormUnit ;

type
  TfrmReportExecPriconectionContracts = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    lblcontractNumberServices: TLabel;
    edtcontractNumberServices: TEdit;
    lblContractDateServices: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    endepartmentCode : Integer;
  end;

var
  frmReportExecPriconectionContracts: TfrmReportExecPriconectionContracts;

implementation
uses EnergyproController, DMReportsUnit, ShowENDepartment,
  ENDepartmentController;

{$R *.dfm}

procedure TfrmReportExecPriconectionContracts.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName, strTabNumbers : String;
begin


   SetLength(argNames, 7);
   SetLength(args, 7);

  argNames[0] := 'contractDateStart';
  if edtDateStart.checked then
  args[0] := DateToStr( edtDateStart.date )
  else
  args[0] := '01.01.1999';

  argNames[1] := 'contractDateFinal';
  if edtDateFinal.checked then
  args[1] := DateToStr( edtDateFinal.date )
  else
  args[1] := '01.01.3000';

  argNames[2] := 'endepartmentCode';
  if endepartmentCode = 0 then
  args[2] := ''
  else
  args[2] := IntToStr(endepartmentCode);

  argNames[3] := 'contractnumberservices';
  args[3] := edtcontractNumberServices.Text ;


  reportName := 'Services/ExecPriconectionContracts/main';

  makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmReportExecPriconectionContracts.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtENDepartmentDepartmentName]);
  endepartmentCode:= 0;
end;

procedure TfrmReportExecPriconectionContracts.spbENDepartmentDepartmentClick(
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
        DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               endepartmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;


end;

end.

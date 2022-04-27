unit AnalysExecutionWorks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ComCtrls , ENPlanWorkController;

type
  TfrmAnalysExecutionWorks = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    procedure spbENElementClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    elementCode : Integer;
    elementName : String;
  end;

var
  frmAnalysExecutionWorks: TfrmAnalysExecutionWorks;

implementation

{$R *.dfm}
uses ShowENElement ,  ENElementController, ChildFormUnit , EnergyproController , DMReportsUnit;

procedure TfrmAnalysExecutionWorks.spbENElementClick(Sender: TObject);
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

procedure TfrmAnalysExecutionWorks.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
Begin

      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'pdatestart';
      args[0] := dateToStr(edtDateStart.date);

      argNames[1] := 'pdatefinal';
      args[1] := dateToStr(edtDateFinal.date);

      argnames[2] := 'elementCode';
      args[2] := IntToStr(elementCode);

      reportName := 'AnalysExecutionWorks';


    makeReport(reportName, argNames, args, 'xls');

end;

end.

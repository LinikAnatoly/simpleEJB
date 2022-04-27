unit EditMetrologyCountersAddToPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , ChildFormUnit, DialogFormUnit, StdCtrls, ShowMetrologyCounter,
  ComCtrls, Buttons
  ;

type
  TfrmMetrologyCountersAddToPlan = class(TDialogForm)
    searchInSC: TButton;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gbWorkOrderData: TGroupBox;
    edtDateStart: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtENWorkerWorkerFactName: TEdit;
    spbENWorkerWorkerFact: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    edtFinMolName: TEdit;
    spbFINMol: TSpeedButton;
    procedure searchInSCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMetrologyCountersAddToPlan: TfrmMetrologyCountersAddToPlan;

implementation

uses ENMetrologyCounterController;

// uses ShowMetrologyCounter;

{$R *.dfm}

procedure TfrmMetrologyCountersAddToPlan.searchInSCClick(Sender: TObject);
var frm : TfrmMetrologyCounterShow;
    f : ENMetrologyCounterFilter;
begin

   f := ENMetrologyCounterFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);

   if edtSerialNumber.Text <> '' then
      f.buildNumber := edtSerialNumber.Text;

   if edtInvNumber.Text <> '' then
      f.invNumber := edtInvNumber.Text;

   if edtName.Text <> '' then
      f.name := edtName.Text;


   frm:=TfrmMetrologyCounterShow.Create(Application, fmNormal, f);

   try



      with frm do
        if ShowModal = mrOk then
        begin
{            try
               if ENMetrologyCounterObj.element = nil then ENMetrologyCounterObj.element := ENElement.Create();
               ENMetrologyCounterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
            }
        end;
   finally
      frm.Free;
   end;
end;

end.

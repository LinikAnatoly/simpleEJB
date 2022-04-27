unit EditChooseTXSDate;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, XSBuiltIns;

type
  TfrmChooseTXSDate = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtDate: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDate: TLabel;
    procedure edtDateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    value : TXSDate;
    { Private declarations }

  public
  
  constructor Create(AOwner: TComponent;
                       FormCaption : string = '';
					             DateLabel : string = '';
                       DefaultValue : TXSDate = nil); overload;
					   
    function GetValue : TXSDate;
    class function choose(FormCaption : string = '';
					             DateLabel : string = '';
                       DefaultValue : TXSDate = nil): TXSDate; stdcall; static;

  end;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit;

{$R *.dfm}

class function TfrmChooseTXSDate.choose(FormCaption : string = '';
					             DateLabel : string = '';
                       DefaultValue : TXSDate = nil): TXSDate;
var
  form : TfrmChooseTXSDate;
  value : TXSDate;
begin
  value := nil;
  form := TfrmChooseTXSDate.Create(Application
    , FormCaption, DateLabel, DefaultValue);
  if form.ShowModal = mrOk then value := form.GetValue;
  Result := value;
  form.Free;
end;


constructor TfrmChooseTXSDate.Create(AOwner: TComponent;
                       FormCaption : string;
					             DateLabel : string;
                       DefaultValue : TXSDate);
var
  tempDate : TDateTime;

begin
    inherited Create(AOWner);
    if(FormCaption <> '') then begin
        Self.Text := FormCaption;
	end;
	if(DateLabel <> '') then begin
	    lblDate.Caption := DateLabel;
	end;

	
	SetDateFieldForDateTimePicker(edtDate, DefaultValue);
  edtDate.Checked := true;
	// Вызов метода для того, чтобы присвоить значение для value
	edtDateChange(nil);
end;

procedure TfrmChooseTXSDate.edtDateChange(Sender: TObject);
begin
  inherited;
  value := GetTXSDateFromTDateTimePicker(edtDate);
end;

procedure TfrmChooseTXSDate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  edtDate.Checked := true;
  value := GetTXSDateFromTDateTimePicker(edtDate);
end;

function TfrmChooseTXSDate.GetValue : TXSDate;
begin
  inherited;
  Result := Self.Value;
end;


end.

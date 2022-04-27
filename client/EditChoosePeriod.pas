unit EditChoosePeriod;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, XSBuiltIns;


type
  TDateArray = array of TDate;

type
  TfrmChoosePeriod = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtDateStart: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    edtDateFinal: TDateTimePicker;
    procedure setPeriod(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDateFinalChange(Sender: TObject);
    procedure edtDateStartChange(Sender: TObject);


  private
    value : TDateArray;
    { Private declarations }

  public

  constructor Create(AOwner: TComponent;
                        DefaultValue : TDateArray;
                       FormCaption : string = ''); overload;
					   
    function GetValue : TDateArray;
  end;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit;

{$R *.dfm}

constructor TfrmChoosePeriod.Create(AOwner: TComponent;
                       DefaultValue : TDateArray;
                       FormCaption : string = '');
var
  tempPeriod : TDateArray;

begin
    inherited Create(AOWner);
    if(FormCaption <> '') then begin
        Self.Text := FormCaption;
	end;

  Self.value := nil;

  if (Assigned(DefaultValue)) and (Length(DefaultValue) > 0) then begin

    if Length(DefaultValue) <> 2 then begin
      raise Exception.Create('Неправильная размерность входящего массива!');
    end;


    edtDateStart.DateTime := DefaultValue[0];
    edtDateFinal.DateTime := DefaultValue[1];

  end else begin
    edtDateStart.DateTime := Now();
    edtDateFinal.DateTime := Now();
  end;

  edtDateStart.Checked := true;
  edtDateFinal.Checked := true;

	// Вызов метода для того, чтобы присвоить значение для value
	setPeriod(nil);
end;

procedure TfrmChoosePeriod.setPeriod(Sender: TObject);
begin
  inherited;
  if not Assigned(value) then begin
    SetLength(value, 2);
  end;

  value[0] := edtDateStart.DateTime;
  value[1] := edtDateFinal.DateTime;
end;

procedure TfrmChoosePeriod.edtDateFinalChange(Sender: TObject);
begin
  inherited;
  setPeriod(Sender);
end;

procedure TfrmChoosePeriod.edtDateStartChange(Sender: TObject);
begin
  inherited;
  Self.setPeriod(Sender);
end;

procedure TfrmChoosePeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrOk then begin
    setPeriod(nil);
    if value[0] > value[1] then begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності!')
        , PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
    end;
  end else begin
    Self.Value := nil;
  end;

end;

function TfrmChoosePeriod.GetValue : TDateArray;
begin
  inherited;
  Result := Self.Value;
end;


end.

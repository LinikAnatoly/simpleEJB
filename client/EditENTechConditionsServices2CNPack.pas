unit EditENTechConditionsServices2CNPack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons;

type
  TfrmENTechConditionsServices2CNPackEdit = class(TDialogForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    edtCNPack: TEdit;
    spbCNPack: TSpeedButton;
    spbCNPackClear: TSpeedButton;
    procedure spbCNPackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbCNPackClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cnPackCode: Integer;
    cnSubsystemCode: Integer;
    contractNumber: String;
  end;

var
  frmENTechConditionsServices2CNPackEdit: TfrmENTechConditionsServices2CNPackEdit;

implementation

uses ShowCNPack, CNPackController, ENConsts, ChildFormUnit;

{$R *.dfm}

procedure TfrmENTechConditionsServices2CNPackEdit.spbCNPackClick(
  Sender: TObject);
var
   frmCNPackShow: TfrmCNPackShow;
   f: CNPackFilter;
begin
  f := CNPackFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // По дефолту фильтруем по № договора на присоединение
  if contractNumber <> '' then
    f.reg_num_cn_contract := contractNumber;

  frmCNPackShow := TfrmCNPackShow.Create(Application, fmNormal, f);
  try
    with frmCNPackShow do
    begin
      // Даем возможность фильтровать 
      //if contractNumber <> '' then
      //  DisableActions([actFilter, actNoFilter]);
      if ShowModal = mrOk then
      begin
        try
          cnPackCode := StrToInt(GetReturnValue(sgCNPack, 1));
          edtCNPack.Text := '(Код: ' + IntToStr(cnPackCode) + ') ' + GetReturnValue(sgCNPack, 2);
          cnSubsystemCode := Integer(sgCNPack.Objects[4, sgCNPack.Row]);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmCNPackShow.Free;
  end;
end;

procedure TfrmENTechConditionsServices2CNPackEdit.FormCreate(
  Sender: TObject);
begin
  cnPackCode := LOW_INT;
  cnSubsystemCode := LOW_INT;
end;

procedure TfrmENTechConditionsServices2CNPackEdit.spbCNPackClearClick(
  Sender: TObject);
begin
  EXIT; // ЗАПРЕЩАЕМ ОСТАВЛЯТЬ ДОГОВОР БЕЗ ПРИВЯЗКИ К ПАКЕТУ!!!

  cnPackCode := LOW_INT;
  cnSubsystemCode := LOW_INT;
  edtCNPack.Text := '';
end;

procedure TfrmENTechConditionsServices2CNPackEdit.FormShow(
  Sender: TObject);
begin
  if cnPackCode <> LOW_INT then
    edtCNPack.Text := IntToStr(cnPackCode);
  DisableControls([edtCNPack]);
end;

end.

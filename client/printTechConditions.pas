unit PrintTechConditions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmPrintTechConditions = class(TForm)
    lblTechConditionStr: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
    edtPatternItems: TComboBox;
    edtTechConditionStr: TMemo;
    procedure edtPatternItemsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintTechConditions: TfrmPrintTechConditions;

implementation

{$R *.dfm}

procedure TfrmPrintTechConditions.edtPatternItemsChange(Sender: TObject);
begin
    if edtPatternItems.ItemIndex = 0 then
       edtTechConditionStr.Text := '������������� �� �������� ������������� �������� ����������� �����, ' +
                  '�� � ������� �������� (����������������� �����), �� ����� ��������� �� ������� ' +
                  '��������� (�� �����������) �� ��������� �� "���������������" ��� ���� ������������ ' +
                  '����� �����; ����������� ����� ������������ ����� �����������㳿 ����� ����� ' +
                  '��. 1 ��. 74 �� ���� ����� ���������� ����㳿�, ��. 1.5. ��� �� ������ V, VI ' +
                  '������� ������������ �����'
    else if edtPatternItems.ItemIndex = 1 then
       edtTechConditionStr.Text := '��������� �������';

end;

end.

unit addENPlanworkItemByCalculationType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls , DialogFormUnit,ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmaddENPlanworkItemByCalculationType = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    lblKarta: TLabel;
    edtTKClassificationTypeName: TEdit;
    spbTKClassificationType: TSpeedButton;
    lbl1: TLabel;
    edtCountWork: TEdit;
    lbl2: TLabel;
    edtTKClassificationTypeKod: TEdit;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    procedure spbTKClassificationTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  tkClassificationTypeCode : Integer;
  planCode : Integer;
  end;

var
  frmaddENPlanworkItemByCalculationType: TfrmaddENPlanworkItemByCalculationType;

implementation

uses
  ShowTKClassificationType, TKClassificationTypeController,
  ENPlanWorkItemController, XSBuiltIns, ENConsts;

{$R *.dfm}

procedure TfrmaddENPlanworkItemByCalculationType.spbTKClassificationTypeClick(
  Sender: TObject);
var
   frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
begin
   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
      with frmTKClassificationTypeShow do
      begin
        DisableActions([frmTKClassificationTypeShow.actNoFilter,
               frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
               frmTKClassificationTypeShow.actDelete]);

        frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

        if ShowModal = mrOk then
        begin
         edtTKClassificationTypeKod.Text := TKClassificationTypeShort(tvDep.Selected.Data).kod;
         edtTKClassificationTypeName.Text := TKClassificationTypeShort(tvDep.Selected.Data).name;
         tkClassificationTypeCode := TKClassificationTypeShort(tvDep.Selected.Data).code;
        end;
      end;
    finally
       frmTKClassificationTypeShow.Free;
    end;

end;

procedure TfrmaddENPlanworkItemByCalculationType.FormShow(Sender: TObject);
begin
   SetFloatStyle(edtCountWork);
   DisableControls([edtTKClassificationTypeKod , edtTKClassificationTypeName ]);
   DenyBlankValues([edtTKClassificationTypeKod, edtTKClassificationTypeName  , edtCountWork]);
end;

procedure TfrmaddENPlanworkItemByCalculationType.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    countGen : TXSDecimal;
begin
  if ModalResult = mrOk then
  begin

  if not NoBlankValues([
      edtTKClassificationTypeKod
      ,edtTKClassificationTypeName
      ,edtCountWork
     ]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    countGen:= TXSDecimal.Create;
    countGen.DecimalString := edtCountWork.Text;

    if tkClassificationTypeCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Невідомий  код Класифікації !'),PChar('Помилка !'),MB_ICONERROR);
      Exit;
    end;

    if planCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Невідомий  код Плана !'),PChar('Помилка !'),MB_ICONERROR);
      Exit;
    end;

    TempENPlanWorkItem.addPlanWorkItemsByClassificationTypeForTechConditions( tkClassificationTypeCode , countGen,planCode );

  end;
end; 
end;

procedure TfrmaddENPlanworkItemByCalculationType.FormCreate(
  Sender: TObject);
begin
     tkClassificationTypeCode := LOW_INT;
     planCode := LOW_INT;
end;

end.

unit EditENPlanWorkItemSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, TB2Item, TB2Dock, TB2Toolbar, ImgList;

type
  TfrmENPlanWorkItemSimpleEdit = class(TDialogForm)
    lblKarta: TLabel;
    edtKartiName: TEdit;
    spbEPKard: TSpeedButton;
    lblCountGen: TLabel;
    edtCountGen: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOTKTechCardPWI: THTTPRIO;
    ImageList1: TImageList;
    tbEPKard: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    tbiSelectFromParent: TTBItem;
    edtKartiNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure spbEPKardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    techCardSourceCondition: String;
    techCardCode: Integer;
  end;

var
  frmENPlanWorkItemSimpleEdit: TfrmENPlanWorkItemSimpleEdit;

implementation

uses ShowTKTechCard, TKTechCardController, ChildFormUnit, ENConsts;

{$R *.dfm}

procedure TfrmENPlanWorkItemSimpleEdit.FormCreate(Sender: TObject);
begin
  techCardCode := LOW_INT;
  techCardSourceCondition := '';
end;

procedure TfrmENPlanWorkItemSimpleEdit.spbEPKardClick(Sender: TObject);
var
   frmKartiShow: TfrmTKTechCardShow;
   TempTKTechCard: TKTechCardControllerSoapPort;
   tcObj: TKTechCard;
begin
   frmKartiShow:=TfrmTKTechCardShow.Create(Application,fmNormal);
   try
      with frmKartiShow do
      begin
        if Self.techCardSourceCondition <> '' then
          frmKartiShow.techCardSourceCondition := Self.techCardSourceCondition; 
        DisableActions([actInsert, actEdit, actDelete]);

        if ShowModal = mrOk then
        begin
            try
               //if ENPlanWorkItemObj.kartaRef = nil then ENPlanWorkItemObj.kartaRef := TKTechCardRef.Create();
               TempTKTechCard := HTTPRIOTKTechCardPWI as TKTechCardControllerSoapPort;
               tcObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(sgTKTechCard,0)));

              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               //ENPlanWorkItemObj.kartaRef.code := tcObj.code; //StrToInt(GetReturnValue(sgTKTechCard,0));
               techCardCode := tcObj.code;
               edtKartiNum.Text := tcObj.techKartNumber; //GetReturnValue(sgTKTechCard,2);
               edtKartiName.Text := tcObj.name; //GetReturnValue(sgTKTechCard,2);
               //edtKartiNum.Text := tcObj.techKartNumber; //GetReturnValue(sgTKTechCard,1);
               //lblMeasure.Caption := 'Вимірювач : ' + tcObj.meter + ' /  Од.виміру : ' + tcObj.measurement.name;

               //if tcObj.normOfTime <> nil then
               //   edtNormTime.Text := tcObj.normOfTime.DecimalString
               //else
               //   edtNormTime.Text := 'нет в нормативе ;)';

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmKartiShow.Free;
   end;
end;

procedure TfrmENPlanWorkItemSimpleEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtKartiName, edtKartiNum]);
  DenyBlankValues([edtKartiName, edtCountGen]);
  SetFloatStyle(edtCountGen);
end;

procedure TfrmENPlanWorkItemSimpleEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([
        edtKartiNum,
        edtKartiName,
        edtCountGen
       ])  then
    begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля !'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
      Action := caNone;
      Exit;
    end;
end;

end.

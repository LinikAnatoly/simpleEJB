
unit EditENPlanWorkMoveHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkMoveHistoryController,
  ENPlanWorkController, DMReportsUnit, ENConsts ;

type
  TfrmENPlanWorkMoveHistoryEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblYearGen : TLabel;
    lblMonthGen : TLabel;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENPlanWorkMoveReasonName : TLabel;
  edtENPlanWorkMoveReasonName: TEdit;
  spbENPlanWorkMoveReason: TSpeedButton;
  

  HTTPRIOENPlanWorkMoveHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    chbIsPlaned: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkMoveReasonClick(Sender : TObject);
    procedure edtYearGenChange(Sender: TObject);
    procedure edtMonthGenChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanWorkMoveHistoryEdit: TfrmENPlanWorkMoveHistoryEdit;
  ENPlanWorkMoveHistoryObj: ENPlanWorkMoveHistory;

implementation

uses
  ShowENPlanWorkMoveReason
  ,ENPlanWorkMoveReasonController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkMoveHistoryController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkMoveHistoryEdit.FormShow(Sender: TObject);
var
 plan : ENPlanWork;
begin

  DisableControls([edtENPlanWorkMoveReasonName]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtYearGen
      ,edtMonthGen
      ,edtENPlanWorkMoveReasonName
     ]);
   end;

  plan := DMReports.getPlanByCode(ENPlanWorkMoveHistoryObj.planRef.code);
  if plan = nil then Exit;

  chbIsPlaned.Visible := (plan.kind.code = ENPLANWORKKIND_CURRENT) and (plan.formRef.code = ENPLANWORKFORM_PLANNED);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      if ENPlanWorkMoveHistoryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkMoveHistoryObj.dateGen.Year,ENPlanWorkMoveHistoryObj.dateGen.Month,ENPlanWorkMoveHistoryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    if ( ENPlanWorkMoveHistoryObj.yearGen <> Low(Integer) ) then
       edtYearGen.ItemIndex := ENPlanWorkMoveHistoryObj.yearGen - 2008 //IntToStr(ENPlanWorkMoveHistoryObj.yearGen)
    else
       edtYearGen.ItemIndex := 0;

    if ( ENPlanWorkMoveHistoryObj.monthGen <> Low(Integer) ) then
       edtMonthGen.ItemIndex := ENPlanWorkMoveHistoryObj.monthGen //IntToStr(ENPlanWorkMoveHistoryObj.monthGen)
    else
       edtMonthGen.ItemIndex := 0;
       
    edtCommentGen.Text := ENPlanWorkMoveHistoryObj.commentGen; 
    edtUserGen.Text := ENPlanWorkMoveHistoryObj.userGen; 
      if ENPlanWorkMoveHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkMoveHistoryObj.dateEdit.Year,ENPlanWorkMoveHistoryObj.dateEdit.Month,ENPlanWorkMoveHistoryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENPlanWorkMoveReasonName.Text := ENPlanWorkMoveHistoryObj.reason.name;

  end;
end;



procedure TfrmENPlanWorkMoveHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  isChangeForm : Boolean;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtYearGen
      ,edtMonthGen
      ,edtENPlanWorkMoveReasonName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    {if edtYearGen.ItemIndex < 1 then
    begin
      Application.MessageBox(PChar('Виберіть новий рік для виконання плану !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action := caNone;
      edtYearGen.SetFocus;
      Exit;
    end;

    if edtMonthGen.ItemIndex < 1 then
    begin
      Application.MessageBox(PChar('Виберіть новий місяць для виконання плану !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action := caNone;
      edtMonthGen.SetFocus;
      Exit;
    end;}

    TempENPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENPlanWorkMoveHistoryObj.dateGen = nil then
          ENPlanWorkMoveHistoryObj.dateGen := TXSDate.Create;
       ENPlanWorkMoveHistoryObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPlanWorkMoveHistoryObj.dateGen := nil;

     if ( edtYearGen.ItemIndex > 0 ) then
       ENPlanWorkMoveHistoryObj.yearGen := edtYearGen.ItemIndex + 2008 //StrToInt(edtYearGen.Text)
     else
       ENPlanWorkMoveHistoryObj.yearGen := Low(Integer) ;

     if ( edtMonthGen.ItemIndex > 0 ) then
       ENPlanWorkMoveHistoryObj.monthGen := edtMonthGen.ItemIndex //StrToInt(edtMonthGen.Text)
     else
       ENPlanWorkMoveHistoryObj.monthGen := Low(Integer) ;

     ENPlanWorkMoveHistoryObj.commentGen := edtCommentGen.Text; 

     {
     ENPlanWorkMoveHistoryObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin
       if ENPlanWorkMoveHistoryObj.dateEdit = nil then
          ENPlanWorkMoveHistoryObj.dateEdit := TXSDate.Create;
       ENPlanWorkMoveHistoryObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanWorkMoveHistoryObj.dateEdit := nil;
     }

    if (chbIsPlaned.Checked) then
      isChangeForm := True
    else isChangeForm := False;

    if DialogState = dsInsert then
    begin
      ENPlanWorkMoveHistoryObj.code:=low(Integer);
      TempENPlanWorkMoveHistory.add(ENPlanWorkMoveHistoryObj, isChangeForm);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkMoveHistory.save(ENPlanWorkMoveHistoryObj);
    end;
  end;
end;

procedure TfrmENPlanWorkMoveHistoryEdit.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, false);
end;

procedure TfrmENPlanWorkMoveHistoryEdit.spbENPlanWorkMoveReasonClick(Sender : TObject);
var 
   frmENPlanWorkMoveReasonShow: TfrmENPlanWorkMoveReasonShow;
begin
   frmENPlanWorkMoveReasonShow:=TfrmENPlanWorkMoveReasonShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkMoveReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkMoveHistoryObj.reason = nil then ENPlanWorkMoveHistoryObj.reason := ENPlanWorkMoveReason.Create();
               ENPlanWorkMoveHistoryObj.reason.code := StrToInt(GetReturnValue(sgENPlanWorkMoveReason,0));
               edtENPlanWorkMoveReasonName.Text:=GetReturnValue(sgENPlanWorkMoveReason,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkMoveReasonShow.Free;
   end;
end;



procedure TfrmENPlanWorkMoveHistoryEdit.edtYearGenChange(Sender: TObject);
begin
  inherited;
if edtYearGen.ItemIndex < 1 then
  edtMonthGen.ItemIndex := 0;
end;

procedure TfrmENPlanWorkMoveHistoryEdit.edtMonthGenChange(Sender: TObject);
begin
  inherited;
if edtMonthGen.ItemIndex < 1 then
   edtYearGen.ItemIndex := 0;
end;

end.
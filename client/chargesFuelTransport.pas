unit chargesFuelTransport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons , ShowTKTransportReal , TKTransportRealController,
  InvokeRegistry, Rio, SOAPHTTPClient , ENTransportItemController , ChildFormUnit;

type
  TfrmchargesFuelTransport = class(TDialogForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    edttravelsheet: TEdit;
    lblTKTransportRealTransportRealName: TLabel;
    edtTKTransportRealTransportRealName: TEdit;
    spbTKTransportRealTransportReal: TSpeedButton;
    spbTransportRealClear: TSpeedButton;
    HTTPRIOTKTransportReal: THTTPRIO;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    chkConvolute: TCheckBox;
    GroupBox1: TGroupBox;
    chbWithoutakt: TCheckBox;
    chbWithakt: TCheckBox;
    lblTransportDepartment: TLabel;
    edtTransportDepartmentName: TEdit;
    spbTransportDepartment: TSpeedButton;
    spbTransportDepartmentClear: TSpeedButton;
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);
    procedure spbTransportRealClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbTransportDepartmentClick(Sender: TObject);
    procedure spbTransportDepartmentClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportRealcode : Integer;
    renCode : Integer;
    renName : String;
  end;

var
  frmchargesFuelTransport: TfrmchargesFuelTransport;
  ENTransportItemObj: ENTransportItem;

implementation

uses DMReportsUnit , ShowENDepartment , ENDepartmentController ,
  ShowENTransportDepartment;

{$R *.dfm}

procedure TfrmchargesFuelTransport.spbTKTransportRealTransportRealClick(
  Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;



   TempENTransportItem: ENTransportItemControllerSoapPort;
   tItemFilter : ENTransportItemFilter;
   tItemList : ENTransportItemShortList;
   i : byte;
begin

   i := IDOK;
   


   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);



//   f.conditionSQL := ' departmentrefcode in (select endepartment.code from endepartment where endepartment.rencode = '+ IntToStr(plan.departmentRef.code) +')';
   f.orderBySQL := 'gosnumber';

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal,f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
              if i = IDOK then
               begin
                   //  if ENTransportItemObj.transportReal = nil then ENTransportItemObj.transportReal := TKTransportReal.Create();
                     transportRealcode := StrToInt(GetReturnValue(sgTKTransportReal,0));
                     edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
               end;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;


procedure TfrmchargesFuelTransport.spbTransportDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
  renCode := 0;
  renName := '';
  edtTransportDepartmentName.Text := '';
end;

procedure TfrmchargesFuelTransport.spbTransportDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
          renCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
          renName := GetReturnValue(sgENTransportDepartment,1);
          edtTransportDepartmentName.Text := renName;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;
end;

procedure TfrmchargesFuelTransport.spbTransportRealClearClick(
  Sender: TObject);
begin
   transportRealcode := 0;
   edtTKTransportRealTransportRealName.Text:= '';
end;

procedure TfrmchargesFuelTransport.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   frmENDepartmentShow.isCheckPodr := True;
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmchargesFuelTransport.FormCreate(Sender: TObject);
begin
    transportRealcode := 0;
    renCode := 0;
    renName := '';
end;

procedure TfrmchargesFuelTransport.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

end.

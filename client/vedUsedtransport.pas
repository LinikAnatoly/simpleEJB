unit vedUsedtransport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons , ShowTKTransportReal , TKTransportRealController,
  InvokeRegistry, Rio, SOAPHTTPClient , ENTransportItemController , ChildFormUnit;

type
  TfrmvedUsedtransport = class(TDialogForm)
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
    cbPlanWorkKind: TComboBox;
    lblENPlanWorkKindKindName: TLabel;
    GroupBox2: TGroupBox;
    lblSpravMol: TLabel;
    spbSpravMol: TSpeedButton;
    spbSpravMolClear: TSpeedButton;
    edtSpravMol: TEdit;
    lblpodrname: TLabel;
    spbpodrname: TSpeedButton;
    spbpodrnameclear: TSpeedButton;
    edtpodrname: TEdit;
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);
    procedure spbTransportRealClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbSpravMolClick(Sender: TObject);
    procedure spbSpravMolClearClick(Sender: TObject);
    procedure spbpodrnameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportRealcode : Integer;
    renCode : Integer;
    renName : String;
    molCode : Integer;
    molName : String;

    planpodrCode : Integer;
    planpodrName : String;
  end;

var
  frmvedUsedtransport: TfrmvedUsedtransport;
  ENTransportItemObj: ENTransportItem;

implementation

uses DMReportsUnit , ShowENDepartment , ENDepartmentController , ShowFINMol , ShowENSpravMol;

{$R *.dfm}

procedure TfrmvedUsedtransport.spbTKTransportRealTransportRealClick(
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


procedure TfrmvedUsedtransport.spbTransportRealClearClick(
  Sender: TObject);
begin
   transportRealcode := 0;
   edtTKTransportRealTransportRealName.Text:= '';
end;

procedure TfrmvedUsedtransport.spbEPRenClick(Sender: TObject);
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

          planpodrCode := 0;
          planpodrName := '';
          edtpodrname.Text := planpodrName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmvedUsedtransport.spbpodrnameClick(Sender: TObject);
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

          planpodrCode := ENDepartmentShort(tvDep.Selected.Data).code;
          planpodrName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtpodrname.Text := planpodrName;

          renCode := 0;
          renName := '';
          edtEPRenName.Text := renName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmvedUsedtransport.FormCreate(Sender: TObject);
begin
    transportRealcode := 0;
    renCode := 0;
    renName := '';
    molCode := -1;

    planpodrCode := 0;
    planpodrName:='';
end;

procedure TfrmvedUsedtransport.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmvedUsedtransport.spbSpravMolClick(Sender: TObject);
var
   frmENSpravMolShow: TfrmENSpravMolShow;

begin


   frmENSpravMolShow:= TfrmENSpravMolShow.Create(Application,fmNormal);
   try
      with frmENSpravMolShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

          molCode := StrToInt(GetReturnValue(sgENSpravMol,1));
          molName := GetReturnValue(sgENSpravMol,2);
          edtSpravMol.Text := molName;
        end;
      end;
   finally
      frmENSpravMolShow.Free;
   end;

end;

procedure TfrmvedUsedtransport.spbSpravMolClearClick(Sender: TObject);
begin
    edtSpravMol.Text:= '';
    molCode:= -1;
    molName := '';

end;

end.

unit EditRealTransportAssignToAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, XSBuiltIns, TKTransportRealController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmRealTransportAssignToAllEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtTKTransportRealTransportRealName: TEdit;
    lblENWorkerWorkerFactName: TLabel;
    spbTKTransportRealTransportReal: TSpeedButton;
    HTTPRIOENTransportItem: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planCode : Integer;
    isDriver : Boolean;
    TKTransportRealObj : TKTransportReal;
  end;

var
  frmRealTransportAssignToAllEdit: TfrmRealTransportAssignToAllEdit;

implementation

uses DMReportsUnit, ENConsts, ChildFormUnit,
     ShowTKTransportReal, ENPlanWorkController, ENTransportItemController;

{$R *.dfm}

procedure TfrmRealTransportAssignToAllEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
  begin
  
  end;
end;

procedure TfrmRealTransportAssignToAllEdit.spbTKTransportRealTransportRealClick(
  Sender: TObject);
  var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
   plan : ENPlanWork;
   TempENTransportItem: ENTransportItemControllerSoapPort;
   tItemFilter : ENTransportItemFilter;
   tItemList : ENTransportItemShortList;
   i : byte;
begin

  inherited;

      if planCode = LOW_INT then
      begin
        Application.MessageBox(PChar('Транспорт додається з плану!!!'), PChar('Увага !'),MB_ICONWARNING);
        exit;
      end;
   i := IDOK;
   
   plan := DMReports.getPlanByCode(planCode);

   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.conditionSQL := ' departmentrefcode in (select endepartment.code from endepartment where endepartment.rencode = '+ IntToStr(plan.departmentRef.code) +')';
   f.orderBySQL := 'gosnumber';

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal,f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try

               tItemFilter := ENTransportItemFilter.Create;
               SetNullIntProps(tItemFilter);
               SetNullXSProps(tItemFilter);
               tItemFilter.transportReal := TKTransportReal.Create;
               tItemFilter.transportReal.code :=  StrToInt(GetReturnValue(sgTKTransportReal,0));
               tItemFilter.conditionSQL := 'entransportitem.planrefcode in (select enplanwork.code from enplanwork where enplanwork.yeargen='+ IntToStr(plan.yearGen) +' and enplanwork.monthgen='+ IntToStr(plan.monthGen)+' and enplanwork.code <> '+ IntToStr(plan.code)+')';
               TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
               tItemList := TempENTransportItem.getScrollableFilteredList(tItemFilter,0,-1);
               if tItemList.totalCount > 0 then
               begin
                   //showMessage('Using in ' + IntToStr(tItemList.totalCount));
                   i := Application.MessageBox(PChar('Этот транспорт уже используеться в '+IntToStr(tItemList.totalCount)+' планах на этот же период! Все равно ипользовать его?'),PChar('Внимание!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2);
               end;

               if i = IDOK then
               begin
                     if TKTransportRealObj = nil then TKTransportRealObj := TKTransportReal.Create();
                     TKTransportRealObj.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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

procedure TfrmRealTransportAssignToAllEdit.FormCreate(Sender: TObject);
begin
  inherited;
  DisableControls([edtTKTransportRealTransportRealName]);
  planCode := LOW_INT;
end;

end.


unit EditENWorkOrderBytFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytController ;

type
  TfrmENWorkOrderBytFilterEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblDateGen: TLabel;
    edtDateGenFrom: TDateTimePicker;
    lblENDepartmentDepartmentRefName: TLabel;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    lblSite: TLabel;
    edtSite: TEdit;
    spbSite: TSpeedButton;
    lblFinWorker: TLabel;
    lblFinWorkerTabNumber: TLabel;
    edtFinWorkerTabNumber: TEdit;
    lblFINWorkerName: TLabel;
    edtFINWorkerName: TEdit;
    spbFinWorker: TSpeedButton;
    lblCode: TLabel;
    edtCode: TEdit;
    edtDateGenTo: TDateTimePicker;
    lblDateGenFrom: TLabel;
    lblDateGenTo: TLabel;
    lblType: TLabel;
    spbType: TSpeedButton;
    edtType: TEdit;
    lblStatus: TLabel;
    spbStatus: TSpeedButton;
    edtStatus: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbSiteClick(Sender: TObject);
    procedure spbFinWorkerClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbStatusClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWorkOrderBytFilterEdit: TfrmENWorkOrderBytFilterEdit;
  ENWorkOrderBytFilterObj: ENWorkOrderBytFilter;

implementation

uses ShowENDepartment, ENDepartmentController, ShowENSite, ENSiteController,
  ShowFINWorker, FINWorkerController, ENConsts, ShowENWorkOrderBytType,
  ENWorkOrderBytTypeController, ShowENWorkOrderBytStatus,
  ENWorkOrderBytStatusController;


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENDepartment, edtSite,
                   edtFinWorkerTabNumber, edtFINWorkerName,
                   edtType, edtStatus]);
  SetIntStyle(edtCode);
end;



procedure TfrmENWorkOrderBytFilterEdit.spbENDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderBytFilterObj.departmentRef = nil then ENWorkOrderBytFilterObj.departmentRef := ENDepartmentRef.Create();
               ENWorkOrderBytFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENWorkOrderBytFilterEdit.spbFinWorkerClick(Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f: FINWorkerFilter;
begin
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if ENWorkOrderBytFilterObj.departmentRef <> nil then
    if ENWorkOrderBytFilterObj.departmentRef.code <> LOW_INT then
      f.departmentCode := IntToStr(ENWorkOrderBytFilterObj.departmentRef.code);

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     if edtDateGenTo.Checked then
     begin
       frmFINWorkerShow.dateGet := TXSDate.Create;
       frmFINWorkerShow.dateGet.XSToNative(GetXSDate(edtDateGenTo.DateTime));
     end
     else if edtDateGenFrom.Checked then
     begin
       frmFINWorkerShow.dateGet := TXSDate.Create;
       frmFINWorkerShow.dateGet.XSToNative(GetXSDate(edtDateGenFrom.DateTime));
     end
     else
       frmFINWorkerShow.dateGet := nil;

     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;

     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
          try
            if ENWorkOrderBytFilterObj.finWorker = nil then
            begin
              ENWorkOrderBytFilterObj.finWorker := FINWorker.Create;
              ENWorkOrderBytFilterObj.finWorker.code := LOW_INT;
            end;

            ENWorkOrderBytFilterObj.finWorker.name := GetReturnValue(sgFINWorker, 1);
            ENWorkOrderBytFilterObj.finWorker.tabNumber := GetReturnValue(sgFINWorker, 2);
            if (GetReturnValue(sgFINWorker, 9) <> '') then
              ENWorkOrderBytFilterObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker, 9))
            else
              ENWorkOrderBytFilterObj.finWorker.finCode := LOW_INT;

            edtFINWorkerName.Text := ENWorkOrderBytFilterObj.finWorker.name;
            edtFinWorkerTabNumber.Text := ENWorkOrderBytFilterObj.finWorker.tabNumber;
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENWorkOrderBytFilterEdit.spbSiteClick(Sender: TObject);
var frmENSiteShow: TfrmENSiteShow;
begin
  frmENSiteShow := TfrmENSiteShow.Create(Application, fmNormal);
  try
    frmENSiteShow.DisableActions([frmENSiteShow.actInsert,
                                  frmENSiteShow.actEdit,
                                  frmENSiteShow.actDelete]);
    with frmENSiteShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          if ENWorkOrderBytFilterObj.siteRef = nil then ENWorkOrderBytFilterObj.siteRef := ENSiteRef.Create();
          ENWorkOrderBytFilterObj.siteRef.code := StrToInt(GetReturnValue(sgENSite, 0));
          edtSite.Text := GetReturnValue(sgENSite, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENSiteShow.Free;
  end;
end;

procedure TfrmENWorkOrderBytFilterEdit.spbStatusClick(Sender: TObject);
var frmENWorkOrderBytStatusShow: TfrmENWorkOrderBytStatusShow;
begin
  frmENWorkOrderBytStatusShow := TfrmENWorkOrderBytStatusShow.Create(Application, fmNormal);
  try
    frmENWorkOrderBytStatusShow.DisableActions([frmENWorkOrderBytStatusShow.actInsert,
                                                frmENWorkOrderBytStatusShow.actEdit,
                                                frmENWorkOrderBytStatusShow.actDelete]);
    with frmENWorkOrderBytStatusShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          if ENWorkOrderBytFilterObj.statusRef = nil then ENWorkOrderBytFilterObj.statusRef := ENWorkOrderBytStatusRef.Create();
          ENWorkOrderBytFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENWorkOrderBytStatus, 0));
          edtStatus.Text := GetReturnValue(sgENWorkOrderBytStatus, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENWorkOrderBytStatusShow.Free;
  end;
end;

procedure TfrmENWorkOrderBytFilterEdit.spbTypeClick(Sender: TObject);
var frmENWorkOrderBytTypeShow: TfrmENWorkOrderBytTypeShow;
begin
  frmENWorkOrderBytTypeShow := TfrmENWorkOrderBytTypeShow.Create(Application, fmNormal);
  try
    frmENWorkOrderBytTypeShow.DisableActions([frmENWorkOrderBytTypeShow.actInsert,
                                              frmENWorkOrderBytTypeShow.actEdit,
                                              frmENWorkOrderBytTypeShow.actDelete]);
    with frmENWorkOrderBytTypeShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          if ENWorkOrderBytFilterObj.typeRef = nil then ENWorkOrderBytFilterObj.typeRef := ENWorkOrderBytTypeRef.Create();
          ENWorkOrderBytFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENWorkOrderBytType, 0));
          edtType.Text := GetReturnValue(sgENWorkOrderBytType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENWorkOrderBytTypeShow.Free;
  end;
end;

procedure TfrmENWorkOrderBytFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  condition : String;
begin
  if (ModalResult = mrOk) then
  begin
    if edtCode.Text <> '' then
      try
        ENWorkOrderBytFilterObj.code := StrToInt(edtCode.Text);
      except
        on EConvertError do ENWorkOrderBytFilterObj.code := LOW_INT;
      end;

    ENWorkOrderBytFilterObj.numberGen := edtNumberGen.Text;

    {
    if edtDateGen.Checked then
    begin
      if ENWorkOrderBytFilterObj.dateGen = nil then
        ENWorkOrderBytFilterObj.dateGen := TXSDate.Create;
      ENWorkOrderBytFilterObj.dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));
    end
    else
      ENWorkOrderBytFilterObj.dateGen := nil;
    }

    condition := '';

    if edtDateGenFrom.Checked then
    begin
      AddCondition(condition, ' enworkorderbyt.dategen >= to_date(''' + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');
    end;

    if edtDateGenTo.Checked then
    begin
      AddCondition(condition, ' enworkorderbyt.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');
    end;

    ENWorkOrderBytFilterObj.commentGen := edtCommentGen.Text;

    ENWorkOrderBytFilterObj.conditionSQL := condition;
  end;
end;




end.
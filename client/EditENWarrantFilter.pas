
unit EditENWarrantFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWarrantController ;

type
  TfrmENWarrantFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TEdit;
    lblWarrantFIO : TLabel;
    edtWarrantFIO: TEdit;

    lblWarrantPosition : TLabel;
    edtWarrantPosition: TEdit;

    lblDateGen : TLabel;
    edtDateGenFrom: TDateTimePicker;
    lblPower : TLabel;
    edtPower: TEdit;

    lblMaxSum : TLabel;
    edtMaxSum: TEdit;



  HTTPRIOENWarrant: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbWarrantStatus: TSpeedButton;
    edtWarrantStatusName: TEdit;
    lblWarrantStatus: TLabel;
    lblENDepartmentName: TLabel;
    spbENDepartment: TSpeedButton;
    edtENDepartmentName: TEdit;
    lblDateGenFrom: TLabel;
    lblDateGenTo: TLabel;
    edtDateGenTo: TDateTimePicker;
    lblName: TLabel;
    edtName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbWarrantStatusClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWarrantFilterEdit: TfrmENWarrantFilterEdit;
  ENWarrantFilterObj: ENWarrantFilter;

implementation

uses ENWarrantStatusController, ShowENWarrantStatus, ShowENDepartment,
  ENDepartmentController;


{uses  
    EnergyproController, EnergyproController2, ENWarrantController  ;
}
{$R *.dfm}



procedure TfrmENWarrantFilterEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtWarrantStatusName, edtENDepartmentName]);
end;



procedure TfrmENWarrantFilterEdit.spbENDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);

   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENWarrantFilterObj.departmentRef = nil then ENWarrantFilterObj.departmentRef := ENDepartmentRef.Create();
               ENWarrantFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENWarrantFilterEdit.spbWarrantStatusClick(Sender: TObject);
var frmENWarrantStatusShow : TfrmENWarrantStatusShow;
    f : ENWarrantStatusFilter;
begin
   f := ENWarrantStatusFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   frmENWarrantStatusShow := TfrmENWarrantStatusShow.Create(Application,fmNormal, f);

   try
      with frmENWarrantStatusShow do
        if ShowModal = mrOk then
        begin
            try
                edtWarrantStatusName.Text := GetReturnValue(sgENWarrantStatus,1);
                ENWarrantFilterObj.warrantStatusRef := ENWarrantStatusRef.Create();
                ENWarrantFilterObj.warrantStatusRef.code := StrToInt(GetReturnValue(sgENWarrantStatus,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWarrantStatusShow.Free;
   end;
end;

procedure TfrmENWarrantFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWarrant: ENWarrantControllerSoapPort;
condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWarrantFilterObj.numbergen := edtNumbergen.Text;
     ENWarrantFilterObj.warrantFIO := edtWarrantFIO.Text;
     ENWarrantFilterObj.warrantPosition := edtWarrantPosition.Text;
     ENWarrantFilterObj.name := edtName.Text;

     condition := '';

     if edtDateGenFrom.checked then
     begin
       AddCondition(condition, ' ENWARRANT.dategen >= to_date('''
        + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtDateGenTo.checked then
     begin
       AddCondition(condition, ' ENWARRANT.dategen <= to_date('''
        + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');
     end;


     if ( edtPower.Text <> '' ) then
       ENWarrantFilterObj.power := StrToInt(edtPower.Text)
     else
       ENWarrantFilterObj.power := Low(Integer) ;

     if (ENWarrantFilterObj.maxSum = nil ) then
       ENWarrantFilterObj.maxSum := TXSDecimal.Create;
     if edtMaxSum.Text <> '' then
       ENWarrantFilterObj.maxSum.decimalString := edtMaxSum.Text 
     else
       ENWarrantFilterObj.maxSum := nil;

     ENWarrantFilterObj.conditionSQL := condition;

  end;
end;




end.
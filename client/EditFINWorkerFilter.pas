
unit EditFINWorkerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINWorkerController ;

type
  TfrmFINWorkerFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblTabNumber : TLabel;
    edtTabNumber: TEdit;
    lblPositionName : TLabel;
    edtPositionName: TEdit;
    lblPositionCode : TLabel;
    edtPositionCode: TEdit;
    lblDepartmentName : TLabel;
    edtDepartmentName: TEdit;
    lblDepartmentCode : TLabel;
    edtDepartmentCode: TEdit;
    lblPriceGen : TLabel;
    edtPriceGen: TEdit;
    lblCategor : TLabel;
    edtCategor: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;


  HTTPRIOFINWorker: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    isNoWork: TCheckBox;
    spbFINExecutor: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINExecutorClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINWorkerFilterEdit: TfrmFINWorkerFilterEdit;
  FINWorkerFilterObj: FINWorkerFilter;

implementation

uses ShowFINExecutorTree, FINExecutorController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, FINWorkerController  ;
}
{$R *.dfm}



procedure TfrmFINWorkerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTabNumber
      ,edtPositionName
      ,edtPositionCode
      ,edtDepartmentName
      ,edtDepartmentCode
      ,edtPriceGen
      ,edtCategor
      ,edtFinCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := FINWorkerObj.name; 



    if ( FINWorkerObj.tabNumber <> Low(Integer) ) then
       edtTabNumber.Text := IntToStr(FINWorkerObj.tabNumber)
    else
       edtTabNumber.Text := '';



    edtPositionName.Text := FINWorkerObj.positionName; 



    if ( FINWorkerObj.positionCode <> Low(Integer) ) then
       edtPositionCode.Text := IntToStr(FINWorkerObj.positionCode)
    else
       edtPositionCode.Text := '';



    edtDepartmentName.Text := FINWorkerObj.departmentName; 



    edtDepartmentCode.Text := FINWorkerObj.departmentCode; 



    if ( FINWorkerObj.priceGen <> nil ) then
       edtPriceGen.Text := FINWorkerObj.priceGen.decimalString
    else
       edtPriceGen.Text := ''; 



    if ( FINWorkerObj.categor <> Low(Integer) ) then
       edtCategor.Text := IntToStr(FINWorkerObj.categor)
    else
       edtCategor.Text := '';



    if ( FINWorkerObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(FINWorkerObj.finCode)
    else
       edtFinCode.Text := '';


  end;

}

end;



procedure TfrmFINWorkerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINWorker: FINWorkerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINWorkerFilterObj.name := edtName.Text;



     if ( edtTabNumber.Text <> '' ) then
       FINWorkerFilterObj.tabNumber := edtTabNumber.Text
     else
       FINWorkerFilterObj.tabNumber := '';

     FINWorkerFilterObj.positionName := edtPositionName.Text; 

     if ( edtPositionCode.Text <> '' ) then
       FINWorkerFilterObj.positionCode := StrToInt(edtPositionCode.Text)
     else
       FINWorkerFilterObj.positionCode := Low(Integer) ;

     //FINWorkerFilterObj.departmentName := edtDepartmentName.Text;

     {

     пока всех .... :) .. уволеных в штатном нету ;) .. НАВЕРНО ;)
     
     if isNoWork.Checked then
         FINWorkerFilterObj.conditionSQL := ' kdv.date_uvol is not null '
     else
         FINWorkerFilterObj.conditionSQL := ' kdv.date_uvol is null ';
     }

     //FINWorkerFilterObj.departmentCode := edtDepartmentCode.Text;
{
     if (FINWorkerFilterObj.priceGen = nil ) then
       FINWorkerFilterObj.priceGen := TXSDecimal.Create;
     FINWorkerFilterObj.priceGen.decimalString := edtPriceGen.Text ;



     if ( edtCategor.Text <> '' ) then
       FINWorkerFilterObj.categor := StrToInt(edtCategor.Text)
     else
       FINWorkerFilterObj.categor := Low(Integer) ;




     if ( edtFinCode.Text <> '' ) then
       FINWorkerFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       FINWorkerFilterObj.finCode := Low(Integer) ;
}




  end;
end;




procedure TfrmFINWorkerFilterEdit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
   finCode: Integer;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // MDAX-441
              finCode := FINExecutorShort(tvDep.Selected.Data).finCode;
              if finCode <> LOW_INT then
                FINWorkerFilterObj.departmentCode := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode)
              else
                FINWorkerFilterObj.departmentCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;

              edtDepartmentName.Text := FINExecutorShort(tvDep.Selected.Data).name;
            {
               if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
               ENPlanWorkObj.finExecutor.name := getFullExecutorName(tvDep.Selected) ; //FINExecutorShort(tvDep.Selected.Data).name;
               ENPlanWorkObj.finExecutor.finCode := FINExecutorShort(tvDep.Selected.Data).finCode;
               ENPlanWorkObj.finExecutor.finTypeName := FINExecutorShort(tvDep.Selected.Data).finTypeName;
               ENPlanWorkObj.finExecutor.finTypeCode := FINExecutorShort(tvDep.Selected.Data).finTypeCode;
               ENPlanWorkObj.finExecutor.finKindName := FINExecutorShort(tvDep.Selected.Data).finKindName;
               ENPlanWorkObj.finExecutor.finKindCode := FINExecutorShort(tvDep.Selected.Data).finKindCode;
               ENPlanWorkObj.finExecutor.finCehName := FINExecutorShort(tvDep.Selected.Data).finCehName;
               ENPlanWorkObj.finExecutor.finCehCode := FINExecutorShort(tvDep.Selected.Data).finCehCode;
               edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name ;
            }
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

end.

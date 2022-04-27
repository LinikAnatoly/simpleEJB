
unit EditENLine10Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENLine10Controller ;

type
  TfrmENLine10FilterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblYearBuild : TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart : TLabel;
    edtYearWorkingStart: TEdit;
    lblNameProject : TLabel;
    edtNameProject: TEdit;
    lblNameBuilder : TLabel;
    edtNameBuilder: TEdit;
    lblMainCustomersData : TLabel;
    edtMainCustomersData: TEdit;
    lblMoreData : TLabel;
    edtMoreData: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    edtEPWorkerName: TEdit;

    HTTPRIOENLine10: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    spbEPWorker: TSpeedButton;
    lblEPVoltageNominal: TLabel;
    edtEPVoltageNominalName: TEdit;
    spbEPVoltageNominal: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbEPWorkerClick(Sender: TObject);
    procedure spbEPVoltageNominalClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    renCondition : string;
  public
    { Public declarations }

end;

var
  frmENLine10FilterEdit: TfrmENLine10FilterEdit;
  ENLine10FilterObj: ENLine10Filter;
  //ENLine10Obj: ENLine10;

implementation

uses ShowEPWorker
  //,EPWorkerController
  ,ShowEPVoltageNominal
  //,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController
, ShowENEPRen;

{uses
    EnergyproController, EnergyproController2, ENLine10Controller  ;
}
{$R *.dfm}


Var workerCode: Integer = -1;


procedure TfrmENLine10FilterEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
    ModalResult := mrOk;
end;


procedure TfrmENLine10FilterEdit.FormShow(Sender: TObject);

begin

renCondition := '';
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInvNumber
      ,edtName
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtInvNumber.Text := ENLine10Obj.invNumber; 



    edtName.Text := ENLine10Obj.name; 



    if ( ENLine10Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine10Obj.yearBuild)
    else
       edtYearBuild.Text := '';



    if ( ENLine10Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine10Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';



    edtNameProject.Text := ENLine10Obj.nameProject; 



    edtNameBuilder.Text := ENLine10Obj.nameBuilder; 



    edtMainCustomersData.Text := ENLine10Obj.mainCustomersData; 



    edtMoreData.Text := ENLine10Obj.moreData; 



      if ENLine10Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLine10Obj.dateGen.Year,ENLine10Obj.dateGen.Month,ENLine10Obj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;


  end;

}

end;



procedure TfrmENLine10FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine10: ENLine10ControllerSoapPort;
condition : string;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLine10FilterObj.invNumber := edtInvNumber.Text; 



     ENLine10FilterObj.name := edtName.Text; 



     if ( edtYearBuild.Text <> '' ) then
       ENLine10FilterObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine10FilterObj.yearBuild := Low(Integer) ;




     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine10FilterObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine10FilterObj.yearWorkingStart := Low(Integer) ;




     ENLine10FilterObj.nameProject := edtNameProject.Text; 



     ENLine10FilterObj.nameBuilder := edtNameBuilder.Text; 



     ENLine10FilterObj.mainCustomersData := edtMainCustomersData.Text; 



     ENLine10FilterObj.moreData := edtMoreData.Text; 

     if edtDateGen.Checked then
     begin
       if ENLine10FilterObj.dateGen = nil then
         ENLine10FilterObj.dateGen := TXSDate.Create;
       ENLine10FilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end;

     if renCondition <> '' then
       AddCondition(condition, renCondition);

     if ENLine10FilterObj.conditionSQL <> '' then
       ENLine10FilterObj.conditionSQL := ENLine10FilterObj.conditionSQL + ' and ' + condition
     else
       ENLine10FilterObj.conditionSQL := condition;

  end;
end;


procedure TfrmENLine10FilterEdit.spbEPWorkerClick(Sender: TObject);
var
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine10FilterObj.worker = nil then ENLine10FilterObj.worker := EPWorker.Create();
               ENLine10FilterObj.worker.code := StrToInt(frmEPWorkerShow.GetReturnValue(frmEPWorkerShow.sgMain,0));
               edtEPWorkerName.Text:=frmEPWorkerShow.GetReturnValue(frmEPWorkerShow.sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;


procedure TfrmENLine10FilterEdit.spbEPVoltageNominalClick(Sender: TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
begin
   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application,fmNormal);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine10FilterObj.voltagenominal = nil then ENLine10FilterObj.voltagenominal := EPVoltageNominal.Create();
               ENLine10FilterObj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;

procedure TfrmENLine10FilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try

               //if (length(ENLine04FilterObj.conditionSQL) = 0 ) then
               //   ENLine04FilterObj.conditionSQL := ' enline10.elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')'
               //else
               //   ENLine04FilterObj.conditionSQL := ENLine04FilterObj.conditionSQL + ' and enline10.elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';

               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
               renCondition := ' enline10.elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';
                  
              {
               if ENElementFilterObj.renRef = nil then ENElementFilterObj.renRef := EPRenRef.Create();
               ENElementFilterObj.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
               }
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.

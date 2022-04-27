
unit EditENLine150Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLine150Controller ;

type
  TfrmENLine150FilterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblLineLength : TLabel;
    edtLineLength: TEdit;
    lblYearBuild : TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart : TLabel;
    edtYearWorkingStart: TEdit;
    lblNameProject : TLabel;
    edtNameProject: TEdit;
    lblNameBuilder : TLabel;
    edtNameBuilder: TEdit;
    lblMoreData : TLabel;
    edtMoreData: TEdit;
    lblChainsLength : TLabel;
    edtChainsLength: TEdit;
    lblChains2Length : TLabel;
    edtChains2Length: TEdit;
    lblLastRepairDate : TLabel;
    edtLastRepairDate: TDateTimePicker;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

  lblEPVoltageNominalName : TLabel;
  edtEPVoltageNominalName: TEdit;
  spbEPVoltageNominal: TSpeedButton;
  
  lblENElementName : TLabel;
  edtENElementName: TEdit;
  spbENElement: TSpeedButton;
  

  HTTPRIOENLine150: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPVoltageNominalClick(Sender : TObject);
  procedure spbENElementClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENLine150FilterEdit: TfrmENLine150FilterEdit;
  ENLine150FilterObj: ENLine150Filter;

implementation

uses
  ShowEPVoltageNominal
  //,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController
, ShowENEPRen;

{uses  
    EnergyproController, EnergyproController2, ENLine150Controller  ;
}
{$R *.dfm}



procedure TfrmENLine150FilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtLineLength
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtInvNumber.Text := ENLine150Obj.invNumber; 



    edtName.Text := ENLine150Obj.name; 



    edtBuhName.Text := ENLine150Obj.buhName; 



    if ( ENLine150Obj.lineLength <> nil ) then
       edtLineLength.Text := ENLine150Obj.lineLength.decimalString
    else
       edtLineLength.Text := ''; 



    if ( ENLine150Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine150Obj.yearBuild)
    else
       edtYearBuild.Text := '';



    if ( ENLine150Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine150Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';



    edtNameProject.Text := ENLine150Obj.nameProject;



    edtNameBuilder.Text := ENLine150Obj.nameBuilder;



    edtMoreData.Text := ENLine150Obj.moreData;



    if ( ENLine150Obj.chainsLength <> nil ) then
       edtChainsLength.Text := ENLine150Obj.chainsLength.decimalString
    else
       edtChainsLength.Text := '';



    if ( ENLine150Obj.chains2Length <> nil ) then
       edtChains2Length.Text := ENLine150Obj.chains2Length.decimalString
    else
       edtChains2Length.Text := ''; 



      if ENLine150Obj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime:=EncodeDate(ENLine150Obj.lastRepairDate.Year,ENLine150Obj.lastRepairDate.Month,ENLine150Obj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;



      if ENLine150Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLine150Obj.dateGen.Year,ENLine150Obj.dateGen.Month,ENLine150Obj.dateGen.Day);
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



procedure TfrmENLine150FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine150: ENLine150ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLine150FilterObj.invNumber := edtInvNumber.Text;

     ENLine150FilterObj.name := edtName.Text;

     ENLine150FilterObj.buhName := edtBuhName.Text;

     if (ENLine150FilterObj.lineLength = nil ) then
       ENLine150FilterObj.lineLength := TXSDecimal.Create;
     if edtLineLength.Text <> '' then
       ENLine150FilterObj.lineLength.decimalString := edtLineLength.Text 
     else
       ENLine150FilterObj.lineLength := nil;

     if ( edtYearBuild.Text <> '' ) then
       ENLine150FilterObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine150FilterObj.yearBuild := Low(Integer) ;

     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine150FilterObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine150FilterObj.yearWorkingStart := Low(Integer) ;

     ENLine150FilterObj.nameProject := edtNameProject.Text; 

     ENLine150FilterObj.nameBuilder := edtNameBuilder.Text; 

     ENLine150FilterObj.moreData := edtMoreData.Text; 

     if (ENLine150FilterObj.chainsLength = nil ) then
       ENLine150FilterObj.chainsLength := TXSDecimal.Create;
     if edtChainsLength.Text <> '' then
       ENLine150FilterObj.chainsLength.decimalString := edtChainsLength.Text 
     else
       ENLine150FilterObj.chainsLength := nil;


     if (ENLine150FilterObj.chains2Length = nil ) then
       ENLine150FilterObj.chains2Length := TXSDecimal.Create;
     if edtChains2Length.Text <> '' then
       ENLine150FilterObj.chains2Length.decimalString := edtChains2Length.Text 
     else
       ENLine150FilterObj.chains2Length := nil;


     if edtlastRepairDate.checked then
     begin
       if ENLine150FilterObj.lastRepairDate = nil then
          ENLine150FilterObj.lastRepairDate := TXSDate.Create;
       ENLine150FilterObj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));
     end
     else
       ENLine150FilterObj.lastRepairDate := nil;

     if edtdateGen.checked then
     begin
       if ENLine150FilterObj.dateGen = nil then
          ENLine150FilterObj.dateGen := TXSDate.Create;
       ENLine150FilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENLine150FilterObj.dateGen := nil;






  end;
end;

procedure TfrmENLine150FilterEdit.spbEPVoltageNominalClick(Sender : TObject);
var
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter; 
begin

   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   EPVoltageNominalFilterObj.conditionSQL := ' code in (1,2,3,4)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);

   //frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application,fmNormal);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine150FilterObj.voltagenominal = nil then ENLine150FilterObj.voltagenominal := EPVoltageNominal.Create();
               ENLine150FilterObj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;


procedure TfrmENLine150FilterEdit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine150FilterObj.element = nil then ENLine150FilterObj.element := ENElement.Create();
               ENLine150FilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





procedure TfrmENLine150FilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENLine150FilterObj.element.renRef = nil then ENLine150FilterObj.element.renRef := EPRenRef.Create();
               //ENLine150FilterObj.element.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               //if length(ENLine150FilterObj.conditionSQL) > 0 then
               //   ENLine150FilterObj.conditionSQL := ENLine150FilterObj.conditionSQL + ' and (elementcode in (select code from enelement where renrefcode = ' + GetReturnValue(sgEPRen,0) + '))'
               //else
                  ENLine150FilterObj.conditionSQL := ' elementcode in (select enelement.code from enelement where renrefcode = ' + GetReturnValue(sgEPRen,0) + ')';

               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.

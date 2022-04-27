
unit EditENLineCableFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLineCableController ;

type
  TfrmENLineCableFilterEdit = class(TDialogForm)

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
    lblMainCustomersData : TLabel;
    edtMainCustomersData: TEdit;
    lblMoreData : TLabel;
    edtMoreData: TEdit;
    lblLastRepairDate : TLabel;
    edtLastRepairDate: TDateTimePicker;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

  lblEPVoltageNominalVoltagenominalName : TLabel;
  edtEPVoltageNominalVoltagenominalName : TEdit;
  spbEPVoltageNominalVoltagenominal : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENLineCable: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPVoltageNominalVoltagenominalClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENLineCableFilterEdit: TfrmENLineCableFilterEdit;
  ENLineCableFilterObj: ENLineCableFilter;

implementation

uses
  ShowEPVoltageNominal
  //,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController
, ShowENEPRen;

{uses  
    EnergyproController, EnergyproController2, ENLineCableController  ;
}
{$R *.dfm}



procedure TfrmENLineCableFilterEdit.FormShow(Sender: TObject);

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

    edtInvNumber.Text := ENLineCableObj.invNumber; 



    edtName.Text := ENLineCableObj.name; 



    edtBuhName.Text := ENLineCableObj.buhName; 



    if ( ENLineCableObj.lineLength <> nil ) then
       edtLineLength.Text := ENLineCableObj.lineLength.decimalString
    else
       edtLineLength.Text := ''; 



    if ( ENLineCableObj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLineCableObj.yearBuild)
    else
       edtYearBuild.Text := '';



    if ( ENLineCableObj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLineCableObj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';



    edtMainCustomersData.Text := ENLineCableObj.mainCustomersData; 



    edtMoreData.Text := ENLineCableObj.moreData; 



      if ENLineCableObj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime:=EncodeDate(ENLineCableObj.lastRepairDate.Year,ENLineCableObj.lastRepairDate.Month,ENLineCableObj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;



      if ENLineCableObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLineCableObj.dateGen.Year,ENLineCableObj.dateGen.Month,ENLineCableObj.dateGen.Day);
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



procedure TfrmENLineCableFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLineCable: ENLineCableControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLineCableFilterObj.invNumber := edtInvNumber.Text; 



     ENLineCableFilterObj.name := edtName.Text; 



     ENLineCableFilterObj.buhName := edtBuhName.Text; 


     if  edtLineLength.Text <> '' then
     begin
       if (ENLineCableFilterObj.lineLength = nil ) then
         ENLineCableFilterObj.lineLength := TXSDecimal.Create;
       ENLineCableFilterObj.lineLength.decimalString := edtLineLength.Text ;
     end
     else
        ENLineCableFilterObj.lineLength := nil;



     if ( edtYearBuild.Text <> '' ) then
       ENLineCableFilterObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLineCableFilterObj.yearBuild := Low(Integer) ;


     if ( edtYearWorkingStart.Text <> '' ) then
       ENLineCableFilterObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLineCableFilterObj.yearWorkingStart := Low(Integer) ;

     ENLineCableFilterObj.mainCustomersData := edtMainCustomersData.Text;

     ENLineCableFilterObj.moreData := edtMoreData.Text;

{     if ENLineCableFilterObj.lastRepairDate = nil then
        ENLineCableFilterObj.lastRepairDate := TXSDate.Create;
      ENLineCableFilterObj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));




     if ENLineCableFilterObj.dateGen = nil then
        ENLineCableFilterObj.dateGen := TXSDate.Create;
      ENLineCableFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));

}



  end;
end;

procedure TfrmENLineCableFilterEdit.spbEPVoltageNominalVoltagenominalClick(Sender : TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter; 
begin
   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   EPVoltageNominalFilterObj.conditionSQL := ' code in (5,6,9,3)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLineCableFilterObj.voltagenominal = nil then ENLineCableFilterObj.voltagenominal := EPVoltageNominal.Create();
               ENLineCableFilterObj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalVoltagenominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;
{
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
begin
   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application,fmNormal);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try

            //   if ENLineCableFilterObj.voltagenominal = nil then ENLineCableFilterObj.voltagenominal := EPVoltageNominal.Create();
            //   ENLineCableFilterObj.voltagenominal.code := StrToInt(GetReturnValue(sgEPVoltageNominal,0));
            //   edtEPVoltageNominalVoltagenominalName.Text:=GetReturnValue(sgEPVoltageNominal,1);
            except
               on EConvertError do Exit;
            end;

        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;
 }

procedure TfrmENLineCableFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLineCableFilterObj.element = nil then ENLineCableFilterObj.element := ENElement.Create();
               ENLineCableFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





procedure TfrmENLineCableFilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENLineCableObj.element.renRef = nil then ENLineCableObj.element.renRef := EPRenRef.Create();
               //ENLineCableObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               ENLineCableFilterObj.conditionSQL := 'enlinecable.elementcode in (select enelement.code from enelement where enelement.renrefcode = '+GetReturnValue(sgEPRen,0) + ')';
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

unit EditENTravelSheetFuelFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetFuelController ;

type
  TfrmENTravelSheetFuelFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblSeries : TLabel;
    edtSeries: TEdit;

    lblNumbers : TLabel;
    edtNumbers: TMemo;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  
  lblTKFuelTypeFuelTypeName : TLabel;
  edtTKFuelTypeFuelTypeName : TEdit;
  spbTKFuelTypeFuelType : TSpeedButton;
  

  HTTPRIOENTravelSheetFuel: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
  procedure spbTKFuelTypeFuelTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTravelSheetFuelFilterEdit: TfrmENTravelSheetFuelFilterEdit;
  ENTravelSheetFuelFilterObj: ENTravelSheetFuelFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
  ,ShowTKFuelType
  ,TKFuelTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENTravelSheetFuelController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetFuelFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENTravelSheetFuelObj.countGen <> nil ) then
       edtCountGen.Text := ENTravelSheetFuelObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtSeries.Text := ENTravelSheetFuelObj.series; 



    MakeMultiline(edtNumbers.Lines, ENTravelSheetFuelObj.numbers);



      if ENTravelSheetFuelObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTravelSheetFuelObj.dateGen.Year,ENTravelSheetFuelObj.dateGen.Month,ENTravelSheetFuelObj.dateGen.Day);
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



procedure TfrmENTravelSheetFuelFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENTravelSheetFuelFilterObj.countGen = nil ) then
       ENTravelSheetFuelFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENTravelSheetFuelFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENTravelSheetFuelFilterObj.countGen := nil;




     ENTravelSheetFuelFilterObj.series := edtSeries.Text; 



     ENTravelSheetFuelFilterObj.numbers := edtNumbers.Text; 



     if edtdateGen.checked then
     begin 
       if ENTravelSheetFuelFilterObj.dateGen = nil then
          ENTravelSheetFuelFilterObj.dateGen := TXSDate.Create;
       ENTravelSheetFuelFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTravelSheetFuelFilterObj.dateGen := nil;




  end;
end;

procedure TfrmENTravelSheetFuelFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelFilterObj.realTransport = nil then ENTravelSheetFuelFilterObj.realTransport := TKTransportReal.Create();
               ENTravelSheetFuelFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;


procedure TfrmENTravelSheetFuelFilterEdit.spbTKFuelTypeFuelTypeClick(Sender : TObject);
var 
   frmTKFuelTypeShow: TfrmTKFuelTypeShow;
begin
   frmTKFuelTypeShow:=TfrmTKFuelTypeShow.Create(Application,fmNormal);
   try
      with frmTKFuelTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelFilterObj.fuelType = nil then ENTravelSheetFuelFilterObj.fuelType := TKFuelType.Create();
               ENTravelSheetFuelFilterObj.fuelType.code := StrToInt(GetReturnValue(sgTKFuelType,0));
               edtTKFuelTypeFuelTypeName.Text:=GetReturnValue(sgTKFuelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKFuelTypeShow.Free;
   end;
end;





end.
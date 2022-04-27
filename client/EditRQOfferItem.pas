
unit EditRQOfferItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOfferItemController ;

type
  TfrmRQOfferItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMaterialNameGen : TLabel;
    edtMaterialNameGen: TEdit;
    lblMeasurementNameGen : TLabel;
    edtMeasurementNameGen: TEdit;
    lblMaterialNameOffer : TLabel;
    edtMaterialNameOffer: TEdit;
    lblMeasurementNameOffer : TLabel;
    edtMeasurementNameOffer: TEdit;
    lblDdsTxtCode : TLabel;
    edtDdsTxtCode: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblPriceWithNds : TLabel;
    edtPriceWithNds: TEdit;
    lblCommentGen : TLabel;
    lblPlannedDateDelivery : TLabel;
    edtPlannedDateDelivery: TDateTimePicker;


  HTTPRIORQOfferItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtCommentGen: TMemo;
    lblOrgName: TLabel;
    edtOrgName: TEdit;
    HTTPRIORQOffer: THTTPRIO;
    lblStatusName: TLabel;
    edtStatusName: TEdit;
    lblOfferStatusName: TLabel;
    edtOfferStatusName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    RQOfferItemObj: RQOfferItem;
  end;

var
  frmRQOfferItemEdit: TfrmRQOfferItemEdit;
  //RQOfferItemObj: RQOfferItem;

implementation

uses RQOfferController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, RQOfferItemController  ;
}
{$R *.dfm}



procedure TfrmRQOfferItemEdit.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(RQOfferItemObj) then
    RQOfferItemObj.Free;
end;

procedure TfrmRQOfferItemEdit.FormShow(Sender: TObject);
var
  TempRQOffer: RQOfferControllerSoapPort;
  TempRQOfferItem: RQOfferItemControllerSoapPort;
  offerShort: RQOfferShort;
  offerItemShort: RQOfferItemShort;
begin
  DisableControls([edtCode, edtOrgName, edtMaterialNameGen, edtMeasurementNameGen,
                   edtDdsTxtCode, edtCountFact, edtStatusName, edtOfferStatusName]);

  SetFloatStyle([edtCountFact, edtPriceWithNds]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      //edtMaterialNameGen
      //,edtMeasurementNameGen
      edtMaterialNameOffer
      ,edtMeasurementNameOffer
      //,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQOfferItemObj.code);

    if RQOfferItemObj.offerRef <> nil then
      if RQOfferItemObj.offerRef.code <> LOW_INT then
      begin
        TempRQOffer := HTTPRIORQOffer as RQOfferControllerSoapPort;
        offerShort := TempRQOffer.getShortObject(RQOfferItemObj.offerRef.code);

        if offerShort <> nil then
        begin
          edtOrgName.Text := offerShort.orgRefName;
          edtOfferStatusName.Text := offerShort.statusRefName;
        end;
      end;

    edtMaterialNameGen.Text := RQOfferItemObj.materialNameGen;
    edtMeasurementNameGen.Text := RQOfferItemObj.measurementNameGen;
    edtMaterialNameOffer.Text := RQOfferItemObj.materialNameOffer;
    edtMeasurementNameOffer.Text := RQOfferItemObj.measurementNameOffer;
    edtDdsTxtCode.Text := RQOfferItemObj.ddsTxtCode;

    if (RQOfferItemObj.countFact <> nil) then
      edtCountFact.Text := RQOfferItemObj.countFact.DecimalString
    else
      edtCountFact.Text := '';

    if (RQOfferItemObj.priceWithNds <> nil) then
      edtPriceWithNds.Text := RQOfferItemObj.priceWithNds.DecimalString
    else
      edtPriceWithNds.Text := '';

    MakeMultiline(edtCommentGen.Lines, RQOfferItemObj.commentGen);

    if RQOfferItemObj.plannedDateDelivery <> nil then
    begin
      edtPlannedDateDelivery.DateTime := EncodeDate(RQOfferItemObj.plannedDateDelivery.Year,
                                                    RQOfferItemObj.plannedDateDelivery.Month,
                                                    RQOfferItemObj.plannedDateDelivery.Day);
      edtPlannedDateDelivery.Checked := true;
    end
    else begin
      edtPlannedDateDelivery.DateTime := SysUtils.Date;
      edtPlannedDateDelivery.Checked := false;
    end;

    /////
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;
    offerItemShort := TempRQOfferItem.getShortObject(RQOfferItemObj.code);

    if offerItemShort <> nil then
      edtStatusName.Text := offerItemShort.statusRefName;
    /////
  end;
end;



procedure TfrmRQOfferItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOfferItem: RQOfferItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMaterialNameGen
      ,edtMeasurementNameGen
      ,edtMaterialNameOffer
      ,edtMeasurementNameOffer
      ,edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOfferItem := HTTPRIORQOfferItem as RQOfferItemControllerSoapPort;


     RQOfferItemObj.materialNameGen := edtMaterialNameGen.Text; 

     RQOfferItemObj.measurementNameGen := edtMeasurementNameGen.Text; 

     RQOfferItemObj.materialNameOffer := edtMaterialNameOffer.Text; 

     RQOfferItemObj.measurementNameOffer := edtMeasurementNameOffer.Text; 

     RQOfferItemObj.ddsTxtCode := edtDdsTxtCode.Text; 

     if (RQOfferItemObj.countFact = nil ) then
       RQOfferItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQOfferItemObj.countFact.decimalString := edtCountFact.Text 
     else
       RQOfferItemObj.countFact := nil;

     if (RQOfferItemObj.priceWithoutNds = nil ) then
       RQOfferItemObj.priceWithoutNds := TXSDecimal.Create;


     if (RQOfferItemObj.priceWithNds = nil ) then
       RQOfferItemObj.priceWithNds := TXSDecimal.Create;
     if edtPriceWithNds.Text <> '' then
       RQOfferItemObj.priceWithNds.decimalString := edtPriceWithNds.Text 
     else
       RQOfferItemObj.priceWithNds := nil;



     RQOfferItemObj.commentGen := edtCommentGen.Text; 

     if edtplannedDateDelivery.checked then
     begin 
       if RQOfferItemObj.plannedDateDelivery = nil then
          RQOfferItemObj.plannedDateDelivery := TXSDate.Create;
       RQOfferItemObj.plannedDateDelivery.XSToNative(GetXSDate(edtplannedDateDelivery.DateTime));
     end
     else
       RQOfferItemObj.plannedDateDelivery := nil;


    if DialogState = dsInsert then
    begin
      RQOfferItemObj.code:=low(Integer);
      TempRQOfferItem.add(RQOfferItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOfferItem.save(RQOfferItemObj);
    end;
  end;
end;


end.
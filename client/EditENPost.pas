unit EditENPost;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENPostController, ExtCtrls ;

type
  TfrmENPostEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblPostNumberGen : TLabel;
    edtPostNumberGen: TEdit;
    lblYearSetup : TLabel;
    edtYearSetup: TEdit;
    lblWoodenLength : TLabel;
    edtWoodenLength: TEdit;
    lblLastRepairDate : TLabel;
    edtLastRepairDate: TDateTimePicker;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENPostTypeName: TLabel;
    edtENPostTypeName: TEdit;
    spbENPostType: TSpeedButton;
    lblENGroundTypeName: TLabel;
    edtENGroundTypeName: TEdit;
    spbENGroundType: TSpeedButton;
    HTTPRIOENPost: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    pnlCopy: TPanel;
    chbCopy: TCheckBox;
    upDwnPostQuantity: TUpDown;
    edtPostQuantity: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENPostTypeClick(Sender : TObject);
    procedure spbENGroundTypeClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure pnlCopyClick(Sender: TObject);
    procedure chbCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  frmENPostEdit: TfrmENPostEdit;
  ENPostObj: ENPost;

implementation

uses
  ShowENElement, ENElementController, ShowENPostType, ENPostTypeController,
  ShowENGroundType, ENGroundTypeController,
  ShowTKMaterials, TKMaterialsController, EditAddress, AddressController;
//  ProvinceController, RegionController, CityTypeController, CityController,
//  StreetTypeController, StreetController


{$R *.dfm}

procedure TfrmENPostEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempAddress: AddressControllerSoapPort;   AddressObj: Address;
//  TempStreet: StreetControllerSoapPort;     StreetObj: Street;
//  TempCity: CityControllerSoapPort;         CityObj: City;
//  TempRegion: RegionControllerSoapPort;     RegionObj: Region;
//  TempProvince: ProvinceControllerSoapPort; ProvinceObj: Province;
//  strHouse, strStreet, strCity, strRegion, strProvince: String;
begin
  SetIntStyle([edtPostQuantity, edtPostNumberGen]);
  DisableControls([edtENPostTypeName, edtENGroundTypeName]);
  if edtName.Text = '' then
    edtName.Text := 'Опора';
  SetFloatStyle([edtWoodenLength]);
  SetIntStyle([edtYearSetup]);
  if DialogState = dsView then
    DisableControls([edtENElementName, spbENElement, spbENPostType,
      spbENGroundType, spbTkMaterials]);
  if (DialogState = dsInsert) then
    DisableControls([edtWoodenLength]);
  if (DialogState = dsEdit) then
    DisableControls([edtWoodenLength], not (ENPostObj.postTtype.code
      in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 21]));

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([{edtName,} edtPostNumberGen]);
  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      frmENPostEdit.pnlCopy.Visible := False; //PRIC-608
      edtCode.Text := IntToStr(ENPostObj.code);
      edtName.Text := ENPostObj.name;


      if ENPostObj.materialRef <> nil then
        if ENPostObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENPostObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      edtPostNumberGen.Text := ENPostObj.postNumberGen;
      if (ENPostObj.yearSetup <> Low(Integer)) then
        edtYearSetup.Text := IntToStr(ENPostObj.yearSetup)
      else
        edtYearSetup.Text := '';
      if ( ENPostObj.woodenLength <> nil ) then
        edtWoodenLength.Text := ENPostObj.woodenLength.decimalString
      else
        edtWoodenLength.Text := '';
      if ENPostObj.lastRepairDate <> nil then
        begin
          edtLastRepairDate.DateTime := EncodeDate(
            ENPostObj.lastRepairDate.Year,
            ENPostObj.lastRepairDate.Month,
            ENPostObj.lastRepairDate.Day);
          edtLastRepairDate.checked := true;
        end
      else
        begin
          edtLastRepairDate.DateTime := SysUtils.Date;
          edtLastRepairDate.checked := false;
        end;
      //edtENElementName.Text := ENPostObj.element.name;
      edtENPostTypeName.Text := ENPostObj.postTtype.name;
      edtENGroundTypeName.Text := ENPostObj.ground.name;
    end;
end;

procedure TfrmENPostEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPost: ENPostControllerSoapPort;
  i, postNumber, postCnt: Integer;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([//edtYearSetup, edtWoodenLength,
    edtPostNumberGen])
  then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),
        PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
  else
    begin
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      ENPostObj.name := edtName.Text;
      ENPostObj.postNumberGen := edtPostNumberGen.Text;
      if ( edtYearSetup.Text <> '' ) then
        ENPostObj.yearSetup := StrToInt(edtYearSetup.Text)
      else
        ENPostObj.yearSetup := Low(Integer) ;
      if (ENPostObj.woodenLength = nil ) then
        ENPostObj.woodenLength := TXSDecimal.Create;
      if edtWoodenLength.Text <> '' then
        ENPostObj.woodenLength.decimalString := edtWoodenLength.Text
      else
        ENPostObj.woodenLength := nil;
      if edtlastRepairDate.checked then
        begin
          if ENPostObj.lastRepairDate = nil then
            ENPostObj.lastRepairDate := TXSDate.Create;
          ENPostObj.lastRepairDate.XSToNative(GetXSDate(
            edtlastRepairDate.DateTime));
        end
      else
       ENPostObj.lastRepairDate := nil;

      postCnt := 0;
      if (chbCopy.Checked) and (edtPostQuantity.Text <> '') then
        postCnt := StrToInt(edtPostQuantity.Text);

      if postCnt = 0 then
        begin
          if DialogState = dsInsert then
            begin
              ENPostObj.code := low(Integer);
              TempENPost.add(ENPostObj);
            end
          else if DialogState = dsEdit then
            TempENPost.save(ENPostObj);
        end
      else
        begin
          postNumber := 0;
          if edtPostNumberGen.Text <> '' then
            if IsIntValue(edtPostNumberGen) then
              postNumber := StrToInt(edtPostNumberGen.Text);
          for i := 1 to postCnt do
            begin
              if postNumber > 0 then
                ENPostObj.postNumberGen := IntToStr(postNumber);
              if i > 1 then
                if ENPostObj.addressRef <> nil then
                  ENPostObj.addressRef.code := low(Integer);
              ENPostObj.code := low(Integer);
              TempENPost.add(ENPostObj);
              postNumber := postNumber + 1;
            end;
        end;
    end;
end;

procedure TfrmENPostEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
//  frmENElementShow := TfrmENElementShow.Create(Application,fmNormal);
//  try
//    with frmENElementShow do
//      if ShowModal = mrOk then
//        begin
//          try
//            if ENPostObj.element = nil then
//              ENPostObj.element := ENElement.Create();
//            ENPostObj.element.code :=
//              StrToInt(GetReturnValue(sgENElement, 0));
//            edtENElementName.Text := GetReturnValue(sgENElement, 1);
//          except
//            on EConvertError do Exit;
//          end;
//        end;
//  finally
//    frmENElementShow.Free;
//  end;
end;

procedure TfrmENPostEdit.spbENPostTypeClick(Sender : TObject);
var frmENPostTypeShow: TfrmENPostTypeShow;
begin
  frmENPostTypeShow := TfrmENPostTypeShow.Create(Application, fmNormal);
  try
    with frmENPostTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENPostObj.postTtype = nil then
              ENPostObj.postTtype := ENPostType.Create();
            ENPostObj.postTtype.code :=
              StrToInt(GetReturnValue(sgENPostType, 0));
            edtENPostTypeName.Text := GetReturnValue(sgENPostType, 1);
            DisableControls([edtWoodenLength], not (ENPostObj.postTtype.code
              in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 21]));
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENPostTypeShow.Free;
  end;
end;

procedure TfrmENPostEdit.spbENGroundTypeClick(Sender : TObject);
var frmENGroundTypeShow: TfrmENGroundTypeShow;
begin
  frmENGroundTypeShow:=TfrmENGroundTypeShow.Create(Application,fmNormal);
  try
    with frmENGroundTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENPostObj.ground = nil then
              ENPostObj.ground := ENGroundType.Create();
            ENPostObj.ground.code :=
              StrToInt(GetReturnValue(sgENGroundType, 0));
            edtENGroundTypeName.Text :=
              GetReturnValue(sgENGroundType, 1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmENGroundTypeShow.Free;
  end;
end;

procedure TfrmENPostEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        DenyGroupSelection := true;
        if ShowModal = mrOk then
        begin
          try
            if ENPostObj.materialRef = nil then
              ENPostObj.materialRef := TKMaterialsRef.Create;
            ENPostObj.materialRef.code :=
              TKMaterialsShort(tvDep.Selected.Data).code;
            edtMaterialsName.Text :=
              TKMaterialsShort(tvDep.Selected.Data).name;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENPostEdit.pnlCopyClick(Sender: TObject);
begin
  chbCopy.Checked := not (chbCopy.Checked);
  chbCopyClick(nil);
end;

procedure TfrmENPostEdit.chbCopyClick(Sender: TObject);
begin
  edtPostQuantity.Visible := chbCopy.Checked;
  upDwnPostQuantity.Visible := chbCopy.Checked;
  if chbCopy.Checked then
    edtPostQuantity.SetFocus;
end;

end.


unit EditENBranch10Item;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENBranch10ItemController;

type
  TfrmENBranch10ItemEdit = class(TDialogForm)
  HTTPRIOENBranch10Item: THTTPRIO;
  btnOk: TButton;
  btnCancel: TButton;
  HTTPRIOENPost: THTTPRIO;
  HTTPRIOSpr_matherial: THTTPRIO;
  HTTPRIOENBranch10: THTTPRIO;
    gbBranch10: TGroupBox;
    edtBranch10Name: TEdit;
    edtPostNumber: TEdit;
    lblBranch10Name: TLabel;
    lblPostNumber: TLabel;
    gbPost: TGroupBox;
    lblName: TLabel;
    lblPostNumberGen: TLabel;
    lblYearSetup: TLabel;
    lblWoodenLength: TLabel;
    lblLastRepairDate: TLabel;
    spbENPostType: TSpeedButton;
    lblENPostTypeName: TLabel;
    spbENGroundType: TSpeedButton;
    lblENGroundTypeName: TLabel;
    lblMaterialsName: TLabel;
    spbTkMaterials: TSpeedButton;
    edtName: TEdit;
    edtPostNumberGen: TEdit;
    edtYearSetup: TEdit;
    edtWoodenLength: TEdit;
    edtLastRepairDate: TDateTimePicker;
    edtENPostTypeName: TEdit;
    edtENGroundTypeName: TEdit;
    edtMaterialsName: TEdit;
    edtCode: TEdit;
    lblCode: TLabel;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENPostTypeClick(Sender: TObject);
  procedure spbENGroundTypeClick(Sender: TObject);
  procedure spbTkMaterialsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENBranch10ItemEdit: TfrmENBranch10ItemEdit;
  ENBranch10ItemObj: ENBranch10Item;

implementation

uses ShowENPost, ENPostController, ENBranch10Controller, ENLine10Controller,
  ShowENPostType, ENPostTypeController,
  ShowENGroundType, ENGroundTypeController,
  ShowTKMaterials, TKMaterialsController,
  ShowENElement, ENElementController;

{$R *.dfm}

procedure TfrmENBranch10ItemEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENBranch10: ENBranch10ControllerSoapPort;
  branch10Obj: ENBranch10;
  TempENPost: ENPostControllerSoapPort;
  postOutObj: ENPost;
  branch10ElementCode, branch10RenCode, brahch10Line10Code: Integer;
begin
  SetFloatStyle([edtWoodenLength]);
  SetIntStyle([edtYearSetup]);
  DisableControls([edtENPostTypeName, edtENGroundTypeName, edtMaterialsName,
    edtBranch10Name, edtPostNumber]);
  if DialogState = dsView then
    DisableControls([spbENPostType, spbENGroundType, spbTkMaterials]);

  if (DialogState = dsInsert) then
    DisableControls([edtWoodenLength]);
  if (DialogState = dsEdit) then
    DisableControls([edtWoodenLength],
      not (ENBranch10ItemObj.post.postTtype.code
        in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 21]));

  if ENBranch10ItemObj.branch10Ref <> nil then
    if ENBranch10ItemObj.branch10Ref.code <> low(Integer) then
      begin
        TempENBranch10 :=
          HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;
        branch10Obj :=
          TempENBranch10.getObject(ENBranch10ItemObj.branch10Ref.code);
        try
          edtBranch10Name.Text := branch10Obj.name;
          branch10ElementCode := branch10Obj.element.code;
          branch10RenCode := branch10Obj.element.renRef.code;
          brahch10Line10Code := branch10Obj.line10Ref.code;
          if branch10Obj.postOutRef <> nil then
            if branch10Obj.postOutRef.code <> low(Integer) then
              begin
                TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
                postOutObj :=
                  TempENPost.getObject(branch10Obj.postOutRef.code);
                try
                  edtPostNumber.Text := postOutObj.postNumberGen;
                finally
                  postOutObj.Free;
                  postOutObj := nil;
                end;
              end;
        finally
          branch10Obj.Free;
          branch10Obj := nil;
        end;
      end;
  edtName.Text := 'Опора';
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      if ENBranch10ItemObj.post = nil then
        begin
          ENBranch10ItemObj.post := ENPost.Create;
          ENBranch10ItemObj.post.element := ENElement.Create;
          ENBranch10ItemObj.post.element.elementInRef := ENElementRef.Create;
          ENBranch10ItemObj.post.element.elementInRef.code :=
            branch10ElementCode;
          ENBranch10ItemObj.post.element.renRef := EPRenRef.Create;
          ENBranch10ItemObj.post.element.renRef.code := branch10RenCode;
          ENBranch10ItemObj.post.line10Ref := ENLine10Ref.Create;
          ENBranch10ItemObj.post.line10Ref.code := brahch10Line10Code;
          try
            ENBranch10ItemObj.post.code := low(integer);
          except
            on EConvertError do Exit;
          end;
        end;
      DenyBlankValues([edtENPostTypeName, edtENGroundTypeName, edtPostNumberGen
         {, edtMaterialsName, edtYearSetup, edtWoodenLength}]);
    end;
  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENBranch10ItemObj.code);
      if ENBranch10ItemObj.post <> nil then
        if ENBranch10ItemObj.post.code <> low(Integer) then
          begin
            edtENPostTypeName.Text := ENBranch10ItemObj.post.postTtype.name;
            edtENGroundTypeName.Text := ENBranch10ItemObj.post.ground.name;
            if ENBranch10ItemObj.post.materialRef <> nil then
              if ENBranch10ItemObj.post.materialRef.code <> Low(Integer) then
                begin
                  TempSpr_matherial :=
                    HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                  Spr_matherialFilterObj := TKMaterialsFilter.Create;
                  SetNullIntProps(Spr_matherialFilterObj);
                  Spr_matherialFilterObj.code :=
                    ENBranch10ItemObj.post.materialRef.code;
                  Spr_matherialList :=
                    TempSpr_matherial.getScrollableFilteredList(
                      Spr_matherialFilterObj, 0, -1);
                  if (Spr_matherialList.totalCount > 0) then
                    edtMaterialsName.Text := Spr_matherialList.list[0].name
                  else
                    edtMaterialsName.Text := '';
                end;
            edtName.Text := ENBranch10ItemObj.post.name;
            edtPostNumberGen.Text := ENBranch10ItemObj.post.postNumberGen;
            if (ENBranch10ItemObj.post.code <> Low(Integer)) then
              edtYearSetup.Text := IntToStr(ENBranch10ItemObj.post.yearSetup);
            if (ENBranch10ItemObj.post.woodenLength <> nil) then
              edtWoodenLength.Text :=
                ENBranch10ItemObj.post.woodenLength.decimalString
            else
              edtWoodenLength.Text := '';
            if ENBranch10ItemObj.post.lastRepairDate <> nil then
              begin
                edtLastRepairDate.DateTime := EncodeDate(
                  ENBranch10ItemObj.post.lastRepairDate.Year,
                  ENBranch10ItemObj.post.lastRepairDate.Month,
                  ENBranch10ItemObj.post.lastRepairDate.Day);
                edtLastRepairDate.checked := true;
              end
            else
              begin
                edtLastRepairDate.DateTime := SysUtils.Date;
                edtLastRepairDate.checked := false;
              end;
          end;
    end;
end;

procedure TfrmENBranch10ItemEdit.FormClose(
  Sender: TObject; var Action: TCloseAction);
var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtENPostTypeName, edtENGroundTypeName,
      edtPostNumberGen {, edtWoodenLength, edtMaterialsName, edtYearSetup}])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
  else
    begin
      TempENBranch10Item :=
        HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
      ENBranch10ItemObj.post.name := edtName.Text;
      ENBranch10ItemObj.post.postNumberGen := edtPostNumberGen.Text;
      if (ENBranch10ItemObj.post.woodenLength = nil ) then
        ENBranch10ItemObj.post.woodenLength := TXSDecimal.Create;
      if edtWoodenLength.Text <> '' then
        ENBranch10ItemObj.post.woodenLength.decimalString :=
          edtWoodenLength.Text
      else
        ENBranch10ItemObj.post.woodenLength := nil;
      if (edtYearSetup.Text <> '') then
        ENBranch10ItemObj.post.yearSetup := StrToInt(edtYearSetup.Text)
      else
        ENBranch10ItemObj.post.yearSetup := Low(Integer) ;
      if edtlastRepairDate.checked then
        begin
          if ENBranch10ItemObj.post.lastRepairDate = nil then
            ENBranch10ItemObj.post.lastRepairDate := TXSDate.Create;
          ENBranch10ItemObj.post.lastRepairDate.XSToNative(GetXSDate(
            edtlastRepairDate.DateTime));
        end
      else
        ENBranch10ItemObj.post.lastRepairDate := nil;
      if DialogState = dsInsert then
        begin
          ENBranch10ItemObj.code := low(Integer);
          TempENBranch10Item.add(ENBranch10ItemObj);
        end
      else if DialogState = dsEdit then
        TempENBranch10Item.save(ENBranch10ItemObj);
    end;
end;

procedure TfrmENBranch10ItemEdit.spbENPostTypeClick(Sender: TObject);
var frmENPostTypeShow: TfrmENPostTypeShow;
begin
  frmENPostTypeShow := TfrmENPostTypeShow.Create(Application, fmNormal);
  try
    with frmENPostTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENBranch10ItemObj.post.postTtype = nil then
              ENBranch10ItemObj.post.postTtype := ENPostType.Create();
            ENBranch10ItemObj.post.postTtype.code :=
              StrToInt(GetReturnValue(sgENPostType, 0));
            edtENPostTypeName.Text := GetReturnValue(sgENPostType, 1);
            DisableControls([edtWoodenLength],
              not (ENBranch10ItemObj.post.postTtype.code
                in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 21]));
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENPostTypeShow.Free;
  end;
end;

procedure TfrmENBranch10ItemEdit.spbENGroundTypeClick(Sender: TObject);
var frmENGroundTypeShow: TfrmENGroundTypeShow;
begin
  frmENGroundTypeShow:=TfrmENGroundTypeShow.Create(Application,fmNormal);
  try
    with frmENGroundTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENBranch10ItemObj.post.ground = nil then
              ENBranch10ItemObj.post.ground := ENGroundType.Create();
            ENBranch10ItemObj.post.ground.code :=
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

procedure TfrmENBranch10ItemEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
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
            if ENBranch10ItemObj.post.materialRef = nil then
              ENBranch10ItemObj.post.materialRef := TKMaterialsRef.Create;
            ENBranch10ItemObj.post.materialRef.code :=
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

end.

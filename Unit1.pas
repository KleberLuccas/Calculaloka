unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform1 = class(TForm)
    Button7: TButton;
    Button10: TButton;
    Button14: TButton;
    Btn_Equal: TButton;
    Button16: TButton;
    Txt_Operacao: TEdit;
    Button17: TButton;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Buttonplus: TButton;
    Button9: TButton;
    Button11: TButton;
    Button12: TButton;
    Txt_resultado: TEdit;
    Button_comma: TButton;
    Button8: TButton;
    Button13: TButton;
    Button15: TButton;
    procedure Number_Click(Sender: TObject);
    procedure Btn_ope_click(Sender: TObject);
    procedure Button_commaClick(Sender: TObject);
    procedure Clear_Click(Sender: TObject);
    procedure Del_Click(Sender: TObject);
    procedure Plus_Minus_click(Sender: TObject);
    procedure ClearAll_Click(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  operacao : integer;
  n1, n2 : currency;
  Form1: TForm1;
  comma : bool;

implementation

{$R *.dfm}

procedure TForm1.Btn_ope_click(Sender: TObject);
begin
  if Txt_operacao.text <> '' then
  begin
    if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] <> '=' then
    begin
      if operacao = 0 then
      begin
        if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '+' then
          operacao := 1
        else if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '-' then
          operacao := 2
        else if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '*' then
          operacao := 3
        else if(Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '/') and (Txt_operacao.text = '0') then
          ShowMessage('Não é possível dividir por 0')
        else if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '/' then
          operacao := 4;
        n1 := strtofloat(Txt_operacao.text);        
        txt_resultado.text := txt_operacao.text + Tbutton(Sender).Caption[length(Tbutton(Sender).Caption)];
        txt_operacao.text := '0';
      end
      else
      showmessage('Operacao já selecionada');
    end else
    if Tbutton(sender).Caption[length(Tbutton(sender).Caption)] = '=' then
    begin
        n2 := strtofloat(Txt_operacao.text);
        if operacao = 0 then
          showmessage('Escolha uma operação');
        if operacao = 1 then
          Txt_resultado.text := floattostr(n1 + n2);
        if operacao = 2 then
          Txt_resultado.text := floattostr(n1 - n2);
        if operacao = 3 then
          Txt_resultado.text := floattostr(n1 * n2);
        if operacao = 4 then
          Txt_resultado.text := floattostr(n1 / n2);
        txt_operacao.text := '0';
        operacao := 0;
        n1 := 0;
        n2 := 0;
    end;
  end;
end;

procedure Tform1.ClearAll_Click(Sender: TObject);
begin
  txt_operacao.text := '0';
  txt_resultado.text := '';
  comma := false;
  operacao := 0;
end;

procedure TForm1.Clear_Click(Sender: TObject);
begin
  txt_operacao.text := '0';
  comma := false;
end;

procedure Tform1.Del_Click(Sender: TObject);
begin
  if Length(Txt_operacao.text) = 1 then
    Txt_operacao.text := '0'
  else
    Txt_operacao.text := copy(Txt_operacao.text,0,Length(Txt_operacao.text)-1);
end;

procedure TForm1.Button_commaClick(Sender: TObject);
begin
  if comma = false then
  begin
    txt_operacao.text := txt_operacao.text + ',';
    comma := true;
  end;
end;

procedure TForm1.Number_Click(Sender: TObject);
begin
    if  Txt_operacao.text <> '0' then
      Txt_Operacao.Text := Txt_Operacao.Text + Tbutton(Sender).Caption[Length(Tbutton(Sender).Caption)]
    else 
    if  Txt_operacao.text = '0' then
      Txt_Operacao.Text := Tbutton(Sender).Caption[Length(Tbutton(Sender).Caption)];
end;

procedure Tform1.Plus_Minus_click(Sender: TObject);
begin
if txt_operacao.text = '0'then
  ShowMessage('Não é possível deixar zero negativo')  
else
  begin
    var erros := false;
      try StrToInt(Txt_operacao.text[1]);
        except
          erros := true;
      end;
      if erros then
        Txt_operacao.text := copy(Txt_operacao.text, 2, length(Txt_operacao.text))
      else
          Txt_operacao.text := '-' + Txt_operacao.text;
  end;
end;
end.
